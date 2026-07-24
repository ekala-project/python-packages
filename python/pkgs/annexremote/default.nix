{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "annexremote";
  version = "1.6.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Lykos153";
    repo = "AnnexRemote";
    tag = "v${version}";
    hash = "sha256-RShDcqAjG+ujGzWu5S9za24WSsIWctqi3nWQ8EU4DTo=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "annexremote" ];

  meta = {
    description = "Helper module to easily develop git-annex remotes";
    homepage = "https://github.com/Lykos153/AnnexRemote";
    license = lib.licenses.gpl3Only;
  };
}

{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  gitUpdater,
  libcst,
  pyyaml,
}:

buildPythonPackage rec {
  pname = "trubar";
  version = "0.3.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "janezd";
    repo = "trubar";
    tag = version;
    hash = "sha256-ChKmeACEMnFcMYSdkdVlFiE3td171ihUS2A+qsP5ASk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    libcst
    pyyaml
  ];

  pythonImportsCheck = [ "trubar" ];

  passthru.updateScript = gitUpdater { };

  meta = {
    description = "Utility for translation of strings and f-strings in Python files";
    homepage = "https://github.com/janezd/trubar";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

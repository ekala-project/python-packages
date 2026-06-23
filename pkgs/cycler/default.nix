{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "cycler";
  version = "0.12.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "matplotlib";
    repo = "cycler";
    tag = "v${version}";
    hash = "sha256-5L0APSi/mJ85SuKCVz+c6Fn8zZNpRm6vCeBO0fpGKxg=";
  };

  nativeBuildInputs = [ setuptools ];

  meta = {
    description = "Composable style cycles";
    homepage = "https://github.com/matplotlib/cycler";
    license = lib.licenses.bsd3;
  };
}

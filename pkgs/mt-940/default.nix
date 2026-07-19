{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "mt-940";
  version = "4.30.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "wolph";
    repo = "mt940";
    tag = "v${version}";
    hash = "sha256-t6FOMu+KcEib+TZAv5uVAzvrUSt/k/RQn28jpdAY5Y0=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "mt940" ];

  meta = {
    description = "Module to parse MT940 files and returns smart Python collections for statistics and manipulation";
    homepage = "https://github.com/WoLpH/mt940";
    license = lib.licenses.bsd3;
  };
}

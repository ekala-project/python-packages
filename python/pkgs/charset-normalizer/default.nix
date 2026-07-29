{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "charset-normalizer";
  version = "3.4.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jawah";
    repo = "charset_normalizer";
    tag = version;
    hash = "sha256-YOskF90ach/qEwnMeYDEEO2H4DOoz/LZApXDRU9mvnM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "charset_normalizer" ];

  meta = {
    description = "Python module for encoding and language detection";
    mainProgram = "normalizer";
    homepage = "https://charset-normalizer.readthedocs.io/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

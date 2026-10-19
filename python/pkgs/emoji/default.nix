{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "emoji";
  version = "2.15.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-6uSrfYZFanCgCphRJaAyY6XqxUzVXlHX4YSx7TtnV+Q=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "emoji" ];

  meta = {
    description = "Emoji for Python";
    homepage = "https://github.com/carpedm20/emoji/";
    license = lib.licenses.bsd3;
  };
})

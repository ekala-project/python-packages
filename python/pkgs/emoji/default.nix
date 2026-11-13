{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "emoji";
  version = "2.16.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-/56bHEg4nveO0Xh+dpPFVehOa7m6wWvh/WXhYW2/gMg=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "emoji" ];

  meta = {
    description = "Emoji for Python";
    homepage = "https://github.com/carpedm20/emoji/";
    license = lib.licenses.bsd3;
  };
})

{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "wget";
  version = "3.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-NeYw7KKqUM6Zi5saEnuyazDf7lc3AngqqYL4dePxYGE=";
    extension = "zip";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "wget" ];

  meta = {
    homepage = "https://bitbucket.org/techtonik/python-wget/";
    description = "Pure python download utility";
    license = lib.licenses.unlicense;
  };
})

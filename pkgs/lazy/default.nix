{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "lazy";
  version = "1.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-cScyTscJ6DJPCMtGEcGr4Bd2vaU7uc5o3F36RsoO0+k=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "lazy" ];

  meta = {
    homepage = "https://github.com/stefanholek/lazy";
    description = "Lazy attributes for Python objects";
    license = lib.licenses.bsd2;
  };
}

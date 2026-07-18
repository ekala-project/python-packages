{
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
}:

buildPythonPackage rec {
  pname = "asyncstdlib";
  version = "3.14.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-+ZOWmSo7unSV2M9sgyv+jIcn9hITIz01aaWpy9HAQ4U=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "asyncstdlib" ];

  meta = {
    description = "Python library that extends the Python asyncio standard library";
    homepage = "https://asyncstdlib.readthedocs.io/";
    license = lib.licenses.mit;
  };
}

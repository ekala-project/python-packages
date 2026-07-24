{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  types-setuptools,
}:

buildPythonPackage rec {
  pname = "types-cffi";
  version = "1.16.0.20241221";
  pyproject = true;

  src = fetchPypi {
    pname = "types_cffi";
    inherit version;
    hash = "sha256-HJZklhj0thRfWCMay5duC0SL5rhH96tzPavmLfv/ZZE=";
  };

  build-system = [ setuptools ];

  dependencies = [ types-setuptools ];

  meta = {
    description = "Typing stubs for cffi";
    homepage = "https://github.com/python/typeshed";
    license = lib.licenses.asl20;
  };
}

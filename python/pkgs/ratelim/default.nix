{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  decorator,
}:

buildPythonPackage rec {
  pname = "ratelim";
  version = "0.1.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-gm0yF34R+aEoMZAcn9pmef1bvqNgWRCCAWcIj1rLsR0=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    decorator
  ];

  pythonImportsCheck = [ "ratelim" ];

  meta = {
    description = "Simple Python library that limits the number of times a function can be called during a time interval";
    homepage = "https://github.com/themiurgo/ratelim";
    license = lib.licenses.mit;
  };
}

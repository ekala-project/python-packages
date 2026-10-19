{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "flashtext";
  version = "2.7";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "1kq5idfp9skqkjdcld40igxn2yqjly8jpmxawkp0skwxw29jpgm1";
  };

  build-system = [ setuptools ];

  # json files that tests look for don't exist in the pypi dist

  meta = {
    homepage = "https://github.com/vi3k6i5/flashtext";
    description = "Python package to replace keywords in sentences or extract keywords from sentences";
    license = lib.licenses.mit;
  };
})

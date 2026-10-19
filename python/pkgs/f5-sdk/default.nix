{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  f5-icontrol-rest,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "f5-sdk";
  version = "3.0.21";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-IokMj9mCMsFMVFYO4CpZUB2i32cOamhS5u2mNkNjljo=";
  };

  build-system = [ setuptools ];

  dependencies = [
    f5-icontrol-rest
    six
  ];

  # needs to be updated to newer pytest version and requires physical device

  pythonImportsCheck = [ "f5" ];

  meta = {
    description = "F5 Networks Python SDK";
    homepage = "https://github.com/F5Networks/f5-common-python";
    license = lib.licenses.asl20;
  };
})

{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "environmental-override";
  version = "0.1.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "1vhd37i6f8xh6kd61yxc2ynzgcln7v2p7fyzjmhbkdnws6gwfs6s";
  };

  build-system = [ setuptools ];

  # No tests have been written for this library.

  pythonImportsCheck = [ "environmental_override" ];

  meta = {
    description = "Easily configure apps using simple environmental overrides";
    homepage = "https://github.com/coddingtonbear/environmental-override";
    license = lib.licenses.mit;
  };
}

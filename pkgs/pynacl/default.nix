{
  lib,
  buildPythonPackage,
  cffi,
  fetchFromGitHub,
  libsodium,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pynacl";
  version = "1.6.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyca";
    repo = "pynacl";
    tag = version;
    hash = "sha256-EzzJVRDgYQO6T8YIQjad/Eb9O+BXT4IpOpa48fpBPnc=";
  };

  build-system = [
    cffi
    setuptools
  ];

  # cffi is listed in both build-system.requires and project.dependencies,
  # and is indeed needed in both when cross-compiling
  dependencies = [ cffi ];

  buildInputs = [ libsodium ];

  propagatedNativeBuildInputs = [ cffi ];

  env.SODIUM_INSTALL = "system";

  pythonImportsCheck = [ "nacl" ];

  meta = {
    description = "Python binding to the Networking and Cryptography (NaCl) library";
    homepage = "https://github.com/pyca/pynacl/";
    license = lib.licenses.asl20;
  };
}

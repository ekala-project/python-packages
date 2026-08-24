{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  openssl,
  setuptools,
}:

buildPythonPackage rec {
  pname = "scrypt";
  version = "0.9.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "holgern";
    repo = "py-scrypt";
    tag = "v${version}";
    hash = "sha256-4jVXaPD57RMe4ef1PVgZwPGAhEHL3RGlu2DSC6lGuR4=";
  };

  build-system = [ setuptools ];

  buildInputs = [ openssl ];

  pythonImportsCheck = [ "scrypt" ];

  meta = {
    description = "Python bindings for the scrypt key derivation function";
    homepage = "https://github.com/holgern/py-scrypt";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}

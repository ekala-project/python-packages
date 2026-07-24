{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  cryptography,
  pycryptodome,
}:

buildPythonPackage rec {
  pname = "joserfc";
  version = "1.7.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "authlib";
    repo = "joserfc";
    tag = version;
    hash = "sha256-VE5WWkklZXMBPS+mXcJj+HLgyBYZkxu2AthLo5V78J8=";
  };

  build-system = [ setuptools ];

  dependencies = [ cryptography ];

  optional-dependencies = {
    drafts = [ pycryptodome ];
  };

  pythonImportsCheck = [ "joserfc" ];

  meta = {
    description = "Implementations of JOSE RFCs in Python";
    homepage = "https://github.com/authlib/joserfc";
    license = lib.licenses.bsd3;
  };
}

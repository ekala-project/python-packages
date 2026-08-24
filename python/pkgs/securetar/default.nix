{ lib
, buildPythonPackage
, cryptography
, fetchFromGitHub
, pynacl
, setuptools
,
}:

buildPythonPackage rec {
  pname = "securetar";
  version = "2026.4.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "home-assistant-libs";
    repo = "securetar";
    tag = version;
    hash = "sha256-y2Ow272094Qrn52LGYkuRcjaR6d0C6bF12g7W6AwSMI=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cryptography
    pynacl
  ];

  pythonImportsCheck = [ "securetar" ];

  meta = {
    description = "Module to handle tarfile backups";
    homepage = "https://github.com/home-assistant-libs/securetar";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}

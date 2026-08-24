{ lib
, buildPythonPackage
, fetchFromGitHub
, paramiko
, requests
, setuptools
,
}:

buildPythonPackage (finalAttrs: {
  pname = "proxmoxer";
  version = "2.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "proxmoxer";
    repo = "proxmoxer";
    tag = finalAttrs.version;
    hash = "sha256-v/QqNCzkcYk2pqr9tTeyvEEeXt4nzqooHAQEIiJitZ4=";
  };

  build-system = [ setuptools ];

  dependencies = [
    paramiko
    requests
  ];

  pythonImportsCheck = [ "proxmoxer" ];

  meta = {
    description = "Python wrapper for Proxmox API v2";
    homepage = "https://github.com/proxmoxer/proxmoxer";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})

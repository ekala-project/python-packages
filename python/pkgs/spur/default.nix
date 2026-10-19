{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  paramiko,
}:

buildPythonPackage rec {
  pname = "spur";
  version = "0.3.23";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mwilliamson";
    repo = "spur.py";
    tag = version;
    hash = "sha256-LTkZ1p2P9fsD+gZEQZaCS68Q6nGc4qFGMNtH75gQmXQ=";
  };

  build-system = [ setuptools ];

  dependencies = [ paramiko ];

  # Tests require a running SSH server

  pythonImportsCheck = [ "spur" ];

  meta = {
    description = "Python module to run commands and manipulate files locally or over SSH";
    homepage = "https://github.com/mwilliamson/spur.py";
    license = lib.licenses.bsd2;
  };
}

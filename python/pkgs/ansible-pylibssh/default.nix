{
  lib,
  buildPythonPackage,
  cython,
  expandvars,
  fetchPypi,
  libssh,
  setuptools,
  setuptools-scm,
  toml,
  wheel,
}:

buildPythonPackage (finalAttrs: {
  pname = "ansible-pylibssh";
  version = "1.5.0a3";
  pyproject = true;

  src = fetchPypi {
    pname = "ansible_pylibssh";
    inherit (finalAttrs) version;
    hash = "sha256-O9DxP/ONLbhlAUsYZvrwUQUHZsARb9zydkuVsgL5Eng=";
  };

  build-system = [
    cython
    expandvars
    setuptools
    setuptools-scm
    toml
    wheel
  ];

  dependencies = [ libssh ];

  pythonImportsCheck = [ "pylibsshext" ];

  meta = {
    description = "Python bindings to client functionality of libssh specific to Ansible use case";
    homepage = "https://github.com/ansible/pylibssh";
    license = lib.licenses.lgpl21Plus;
  };
})

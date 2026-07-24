{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "imap-tools";
  version = "1.14.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ikvk";
    repo = "imap_tools";
    tag = "v${version}";
    hash = "sha256-lPVluJCxW5skrgT6Ih23pbRSkfH7+6KuYXk773EVj3w=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "imap_tools" ];

  meta = {
    description = "Work with email and mailbox by IMAP";
    homepage = "https://github.com/ikvk/imap_tools";
    license = lib.licenses.asl20;
  };
}

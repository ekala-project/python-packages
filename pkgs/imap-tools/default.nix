{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "imap-tools";
  version = "1.13.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ikvk";
    repo = "imap_tools";
    tag = "v${version}";
    hash = "sha256-1BcSF40yUbOvOVDsoqS4AXRU2GZ1a3f9p8Xz7crsfwc=";
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

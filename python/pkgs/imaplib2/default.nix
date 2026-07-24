{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "imaplib2";
  version = "3.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jazzband";
    repo = "imaplib2";
    tag = "v${version}";
    hash = "sha256-daQDQZelKzWN/1zdcnKue2vj12BIlknSWIu4bfuIWpE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "imaplib2" ];

  meta = {
    description = "Threaded Python IMAP4 client";
    homepage = "https://github.com/jazzband/imaplib2";
    license = lib.licenses.mit;
  };
}

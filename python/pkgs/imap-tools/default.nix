{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "imap-tools";
  version = "1.15.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ikvk";
    repo = "imap_tools";
    tag = "v${version}";
    hash = "sha256-AnAplrYjqy9K/GagiDgmExnOL9poEQ7Ksjyv8QdATIE=";
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

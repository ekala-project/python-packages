{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  typing-extensions,
}:

buildPythonPackage {
  pname = "psycopg-pool";
  version = "3.3.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "psycopg";
    repo = "psycopg";
    tag = "3.3.4";
    hash = "sha256-hHgswbqaoQRQrUxhNFG6tfmlap1mVUo/OkNsWF686U4=";
  };

  postPatch = ''
    cd psycopg_pool
  '';

  build-system = [ setuptools ];

  dependencies = [ typing-extensions ];

  # the psycopg-pool version isn't updated in tandem with psycopg
  dontCheckPythonMetadata = true;

  doCheck = false;

  meta = {
    description = "Connection Pool for Psycopg";
    homepage = "https://github.com/psycopg/psycopg";
    license = lib.licenses.lgpl3Plus;
    maintainers = [ ];
  };
}

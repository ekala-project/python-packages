{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  installShellFiles,
}:

buildPythonPackage rec {
  pname = "sqlparse";
  version = "0.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ETw1x1Nlq5zJxyMdaMZCj7EcCF/I6esa1lm33b9s0rk=";
  };

  build-system = [ hatchling ];

  nativeBuildInputs = [ installShellFiles ];

  postInstall = ''
    installManPage docs/sqlformat.1
  '';

  meta = {
    description = "Non-validating SQL parser for Python";
    longDescription = ''
      Provides support for parsing, splitting and formatting SQL statements.
    '';
    homepage = "https://github.com/andialbrecht/sqlparse";
    license = lib.licenses.bsd3;
    mainProgram = "sqlformat";
  };
}

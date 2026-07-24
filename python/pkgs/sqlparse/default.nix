{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  installShellFiles,
}:

buildPythonPackage rec {
  pname = "sqlparse";
  version = "0.5.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-4g1KmwuFhf32OxDTAGbHyUxden7EfIiaLYOjyqk/8o4=";
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

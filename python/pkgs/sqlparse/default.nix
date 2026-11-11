{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  installShellFiles,
}:

buildPythonPackage (finalAttrs: {
  pname = "sqlparse";
  version = "0.6.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-ynIlc/hI/y0w5A6jD1OhBLfep2NeqShYkSY+ssWPtuc=";
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
})

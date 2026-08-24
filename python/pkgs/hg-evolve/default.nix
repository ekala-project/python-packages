{
  lib,
  buildPythonPackage,
  fetchPypi,
  mercurial,
  setuptools,
}:

buildPythonPackage rec {
  pname = "hg-evolve";
  version = "11.1.10";
  pyproject = true;

  src = fetchPypi {
    pname = "hg_evolve";
    inherit version;
    hash = "sha256-ccFq7sASkOkFJ4Or5dhZpfKR0FdZAmbziDfK3FGcaYM=";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Enables the “changeset evolution” feature of Mercurial core";
    homepage = "https://www.mercurial-scm.org/doc/evolution/";
    maintainers = [ ];
    license = lib.licenses.gpl2Plus;
  };
}

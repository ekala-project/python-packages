{
  lib,
  buildPythonPackage,
  fetchPypi,
  mercurial,
  setuptools,
}:

buildPythonPackage rec {
  pname = "hg-evolve";
  version = "12.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "hg_evolve";
    inherit version;
    hash = "sha256-WQp1raCE+hpmjutvXVWDh5dUNy+fEI6vXJsthLiY9dA=";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Enables the “changeset evolution” feature of Mercurial core";
    homepage = "https://www.mercurial-scm.org/doc/evolution/";
    license = lib.licenses.gpl2Plus;
  };
}

{
  lib,
  buildPythonPackage,
  cached-property,
  chevron,
  fetchPypi,
  # build-system
  setuptools,
  frozendict,
  pystache,
  pyyaml,
}:

buildPythonPackage (finalAttrs: {
  pname = "genanki";
  version = "0.13.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-hNCQQjqIeVIEZb/peECD7ay4014rpRH6Whve8B2Pce0=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cached-property
    chevron
    frozendict
    pystache
    pyyaml
  ];

  postPatch = ''
    substituteInPlace setup.py \
      --replace "'pytest-runner'," ""
  '';

  # relies on upstream anki

  pythonImportsCheck = [ "genanki" ];

  meta = {
    description = "Generate Anki decks programmatically";
    homepage = "https://github.com/kerrickstaley/genanki";
    license = lib.licenses.mit;
  };
})

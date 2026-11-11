{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  hatch-vcs,
  attrs,
  deprecated,
  hepunits,
}:

buildPythonPackage (finalAttrs: {
  pname = "particle";
  version = "1.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-vVUWXeV1TgjXyRN9lrrc2lVA+PYBTeyWgMlrd4LmzSY=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace '"--benchmark-disable",' ""
  '';

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    attrs
    deprecated
    hepunits
  ];

  pythonImportsCheck = [ "particle" ];

  meta = {
    description = "Package to deal with particles, the PDG particle data table and others";
    homepage = "https://github.com/scikit-hep/particle";
    license = lib.licenses.bsd3;
  };
})

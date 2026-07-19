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

buildPythonPackage rec {
  pname = "particle";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-SRRd7By1BEsH8+jpAigPoFCVD6hFsFgAPmneUZu1BJI=";
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
}

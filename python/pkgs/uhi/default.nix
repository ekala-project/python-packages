{
  lib,
  fetchPypi,
  buildPythonPackage,
  h5py,
  hatchling,
  hatch-vcs,
  fastjsonschema,
  numpy,
  uhi,
}:

buildPythonPackage rec {
  pname = "uhi";
  version = "1.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-05xNwWLWkby0Q1KanPX+mbEeFKOHzfgoQVTMJYcNL/A=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    numpy
  ];
  optional-dependencies = {
    schema = [ fastjsonschema ];
    hdf5 = [ h5py ];
  };

  passthru.tests.uhi = uhi.overridePythonAttrs { doCheck = true; };

  meta = {
    description = "Universal Histogram Interface";
    homepage = "https://uhi.readthedocs.io/";
    license = lib.licenses.bsd3;
  };
}

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

buildPythonPackage (finalAttrs: {
  pname = "uhi";
  version = "1.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-/G7lskV69UTYmATvX1Uwyl/JSKUuMWjNXEU5sDp0Lc4=";
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
})

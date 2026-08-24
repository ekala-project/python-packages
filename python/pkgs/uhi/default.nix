{ lib
, fetchPypi
, buildPythonPackage
, h5py
, hatchling
, hatch-vcs
, fastjsonschema
, numpy
, uhi
,
}:

buildPythonPackage rec {
  pname = "uhi";
  version = "1.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-MxGIlJsaScjbnvnVC3xNTfRgYRXRR97ZfE8FDagnDnQ=";
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
    maintainers = [ ];
  };
}

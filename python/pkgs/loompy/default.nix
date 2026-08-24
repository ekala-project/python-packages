{ lib
, fetchPypi
, buildPythonPackage
, h5py
, numpy
, scipy
, numba
, click
, numpy-groupies
, setuptools
,
}:
let
  finalAttrs = {
    pname = "loompy";
    version = "3.0.8";
    pyproject = true;

    src = fetchPypi {
      inherit (finalAttrs) pname version;
      hash = "sha256-wfSNC/Iaorve7iGgV3VTy6lgnZQ118MraHaGu7WGnKc=";
    };

    build-system = [ setuptools ];

    dependencies = [
      h5py
      numpy
      scipy
      numba
      click
      numpy-groupies
    ];

    # Deprecated numpy attributes access
    pythonImportsCheck = [ "loompy" ];

    meta = {
      description = "Python implementation of the Loom file format";
      homepage = "https://github.com/linnarsson-lab/loompy";
      license = lib.licenses.bsd2;
      maintainers = [ ];
      mainProgram = "loompy";
    };
  };
in
buildPythonPackage finalAttrs

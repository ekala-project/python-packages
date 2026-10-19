{
  lib,
  astropy,
  buildPythonPackage,
  dask,
  fetchPypi,
  numpy,
  oldest-supported-numpy,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "casa-formats-io";
  version = "0.3.0";
  pyproject = true;
  prproject = true;

  src = fetchPypi {
    pname = "casa_formats_io";
    inherit (finalAttrs) version;
    hash = "sha256-FpQj0XeZ7vvOzUM/+5qG6FRwNXl3gzoUBItYdQ1M4m4=";
  };

  build-system = [ setuptools-scm ];

  nativeBuildInputs = [ oldest-supported-numpy ];

  dependencies = [
    astropy
    dask
    numpy
  ];

  # Tests require a large (800 Mb) dataset

  pythonImportsCheck = [ "casa_formats_io" ];

  meta = {
    description = "Dask-based reader for CASA data";
    homepage = "https://casa-formats-io.readthedocs.io/";
    license = lib.licenses.lgpl2Only;
  };
})

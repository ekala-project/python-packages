{
  lib,
  buildPythonPackage,
  fetchPypi,
  numpy,
  setuptools,
}:

buildPythonPackage rec {
  pname = "tifffile";
  version = "2026.9.9";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-XloN+hbmN2vwYrxG4huJb7/olfy0dVmvnGS5std7tKA=";
  };

  build-system = [ setuptools ];

  dependencies = [ numpy ];
  pythonImportsCheck = [ "tifffile" ];

  # flaky, often killed due to OOM or timeout
  env.SKIP_LARGE = "1";

  meta = {
    description = "Read and write image data from and to TIFF files";
    homepage = "https://github.com/cgohlke/tifffile/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}

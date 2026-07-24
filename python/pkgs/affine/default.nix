{
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
}:

buildPythonPackage rec {
  pname = "affine";
  version = "2.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ok2BjWqDbBMZdtIvjCe408oy0K9kwdjSnet7r6TaHuo=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "affine" ];

  meta = {
    description = "Matrices describing affine transformation of the plane";
    homepage = "https://github.com/rasterio/affine";
    license = lib.licenses.bsd3;
  };
}

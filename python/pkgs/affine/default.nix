{
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
  attrs,
}:

buildPythonPackage rec {
  pname = "affine";
  version = "3.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-4bPDjF1NPvUCShgqbRvx4MUasiGCV4HHQa600MB5p+I=";
  };

  build-system = [ flit-core ];

  dependencies = [ attrs ];

  pythonImportsCheck = [ "affine" ];

  meta = {
    description = "Matrices describing affine transformation of the plane";
    homepage = "https://github.com/rasterio/affine";
    license = lib.licenses.bsd3;
  };
}

{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  einops,
  numba,
  numpy,
  scipy,
  xarray,
}:

buildPythonPackage (finalAttrs: {
  pname = "xarray-einstats";
  version = "0.11.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "arviz-devs";
    repo = "xarray-einstats";
    tag = "v${finalAttrs.version}";
    hash = "sha256-mGRalZ9OSh3CtfhLy2E6LOQVBDoq8c777Q9WnyMtjpU=";
  };

  build-system = [ flit-core ];

  dependencies = [
    numpy
    scipy
    xarray
  ];

  optional-dependencies = {
    einops = [ einops ];
    numba = [ numba ];
  };

  pythonImportsCheck = [ "xarray_einstats" ];

  meta = {
    description = "Stats, linear algebra and einops for xarray";
    homepage = "https://github.com/arviz-devs/xarray-einstats";
    license = lib.licenses.asl20;
  };
})

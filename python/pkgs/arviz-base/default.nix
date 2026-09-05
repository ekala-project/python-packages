{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  flit-core,

  # dependencies
  lazy-loader,
  numpy,
  typing-extensions,
  xarray,

  # optional-dependencies
  h5netcdf,
  netcdf4,
}:

buildPythonPackage (finalAttrs: {
  pname = "arviz-base";
  version = "1.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "arviz-devs";
    repo = "arviz-base";
    tag = "v${finalAttrs.version}";
    hash = "sha256-viGjQrAeelzC7DBqMA4kltBllDAXJvymWdntOMYapEA=";
  };

  build-system = [ flit-core ];

  dependencies = [
    lazy-loader
    numpy
    typing-extensions
    xarray
  ];

  optional-dependencies = {
    h5netcdf = [ h5netcdf ];
    netcdf4 = [ netcdf4 ];
  };

  pythonImportsCheck = [ "arviz_base" ];

  meta = {
    description = "Base ArviZ features and converters";
    homepage = "https://github.com/arviz-devs/arviz-base";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})

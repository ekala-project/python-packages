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
  version = "1.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "arviz-devs";
    repo = "arviz-base";
    tag = "v${finalAttrs.version}";
    hash = "sha256-IMS5t+ezAoALBxk0PnX7G+DFNfYW20Qd+/M2p1IzktA=";
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

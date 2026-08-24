{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools-scm,
  # dependencies
  pandas,
  xarray,
}:

buildPythonPackage (finalAttrs: {
  pname = "pandas-flavor";
  version = "0.8.1";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "pyjanitor-devs";
    repo = "pandas_flavor";
    tag = "v${finalAttrs.version}";
    hash = "sha256-c1pHH8vQOl1qicJJCVGuQoPbJp9uK03KDVr+rJWByhY=";
  };

  build-system = [
    setuptools-scm
  ];

  dependencies = [
    pandas
    xarray
  ];

  pythonImportsCheck = [
    "pandas_flavor"
  ];

  meta = {
    description = "The easy way to write your own flavor of Pandas";
    homepage = "https://github.com/pyjanitor-devs/pandas_flavor";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})

{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  tzdata,
}:

buildPythonPackage rec {
  pname = "pytz-deprecation-shim";
  version = "0.1.0.post0";
  pyproject = true;

  src = fetchPypi {
    pname = "pytz_deprecation_shim";
    inherit version;
    hash = "sha256-rwl7rhthbd5cV0REHi3caedN/csMJjEpYQ2FuHRFpZ0=";
  };

  build-system = [ setuptools ];

  dependencies = [ tzdata ];

  pythonImportsCheck = [ "pytz_deprecation_shim" ];

  meta = {
    description = "Shims to make deprecation of pytz easier";
    homepage = "https://github.com/pganssle/pytz-deprecation-shim";
    license = lib.licenses.asl20;
  };
}

{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  numpy,
}:

buildPythonPackage rec {
  pname = "airtouch4pyapi";
  version = "1.0.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "LonePurpleWolf";
    repo = "airtouch4pyapi";
    tag = "v${version}";
    hash = "sha256-RiRwebumidn0nijL/e9J74ZYx0DASi1up5BTNxYoGEA=";
  };

  build-system = [ setuptools ];

  dependencies = [ numpy ];

  # Project has no tests

  pythonImportsCheck = [ "airtouch4pyapi" ];

  meta = {
    description = "Python API for Airtouch 4 controllers";
    homepage = "https://github.com/LonePurpleWolf/airtouch4pyapi";
    license = lib.licenses.mit;
  };
}

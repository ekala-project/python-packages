{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  poetry-core,
}:

buildPythonPackage rec {
  pname = "tomlkit";
  version = "0.15.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-4lu/OIQwBSRiEKEpgndvJ/mcub5nFg4UQ00MDSHuHpc=";
  };

  build-system = [ poetry-core ];
  pythonImportsCheck = [ "tomlkit" ];

  meta = {
    homepage = "https://github.com/sdispater/tomlkit";
    description = "Style-preserving TOML library for Python";
    license = lib.licenses.mit;
  };
}

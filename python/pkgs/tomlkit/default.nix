{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  poetry-core,
}:

buildPythonPackage rec {
  pname = "tomlkit";
  version = "0.15.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-fRqey6MIZjghGxOBTqeckN1U3RGZNWQ3bzqpInH1x6M=";
  };

  build-system = [ poetry-core ];
  pythonImportsCheck = [ "tomlkit" ];

  meta = {
    homepage = "https://github.com/sdispater/tomlkit";
    description = "Style-preserving TOML library for Python";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

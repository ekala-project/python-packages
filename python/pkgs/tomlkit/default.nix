{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  poetry-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "tomlkit";
  version = "0.15.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-g+MnVbodINk0C9Bp7pfp9iMrojRrY//LpCXeAffjJ6Y=";
  };

  build-system = [ poetry-core ];
  pythonImportsCheck = [ "tomlkit" ];

  meta = {
    homepage = "https://github.com/sdispater/tomlkit";
    description = "Style-preserving TOML library for Python";
    license = lib.licenses.mit;
  };
})

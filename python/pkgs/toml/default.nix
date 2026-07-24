{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "toml";
  version = "0.10.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-s72h0QjV3Zn0og0k2cNI6RxNt6sbdJIAve0vg5zL5o8=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "toml" ];

  meta = {
    description = "Python library for parsing and creating TOML";
    homepage = "https://github.com/uiri/toml";
    license = lib.licenses.mit;
  };
}

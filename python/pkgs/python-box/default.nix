{
  lib,
  buildPythonPackage,
  cython,
  fetchFromGitHub,
  msgpack,
  pyyaml,
  ruamel-yaml,
  setuptools,
  toml,
  tomli-w,
}:

buildPythonPackage rec {
  pname = "python-box";
  version = "7.3.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "cdgriffith";
    repo = "Box";
    tag = version;
    hash = "sha256-aVPjIoizqC0OcG5ziy/lvp/JsFSUvcLUqJ03mKViKFs=";
  };

  build-system = [
    cython
    setuptools
  ];

  optional-dependencies = {
    all = [
      msgpack
      ruamel-yaml
      toml
    ];
    yaml = [ ruamel-yaml ];
    ruamel-yaml = [ ruamel-yaml ];
    PyYAML = [ pyyaml ];
    tomli = [ tomli-w ];
    toml = [ toml ];
    msgpack = [ msgpack ];
  };
  pythonImportsCheck = [ "box" ];

  meta = {
    description = "Python dictionaries with advanced dot notation access";
    homepage = "https://github.com/cdgriffith/Box";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

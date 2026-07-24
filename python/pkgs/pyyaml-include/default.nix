{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  fsspec,
  pyyaml,

  # tests
  aiohttp,
}:

buildPythonPackage rec {
  pname = "pyyaml-include";
  version = "2.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tanbro";
    repo = "pyyaml-include";
    tag = "v${version}";
    hash = "sha256-nswSYRTZ6LTLSGh78DnrXl3q06Ap1J1IMKOESv1lJoY=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    fsspec
    pyyaml
  ];
  pythonImportsCheck = [ "yaml_include" ];
  meta = {
    description = "Extending PyYAML with a custom constructor for including YAML files within YAML files";
    homepage = "https://github.com/tanbro/pyyaml-include";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
  };
}

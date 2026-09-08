{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  setuptools-scm,
  # dependencies
  msgpack,
  numpy,
  ruamel-yaml,
  # optional-dependencies
  coverage,
  pymongo,
  pytest,
  pytest-cov,
  types-requests,
  sphinx,
  sphinx-rtd-theme,
  orjson,
  pandas,
  pydantic,
  tqdm,
  invoke,
  requests,
  # tests
  ipython,
}:

buildPythonPackage rec {
  pname = "monty";
  version = "2026.7.16";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "materialsvirtuallab";
    repo = "monty";
    tag = "v${version}";
    hash = "sha256-x5FNw7E3rtrgCWVhMsBpnO+uwu+mB3ELNFdd33+uFds=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    msgpack
    numpy
    ruamel-yaml
  ];

  optional-dependencies = rec {
    ci = [
      coverage
      pymongo
      pytest
      pytest-cov
      types-requests
    ];
    dev = [ ipython ];
    docs = [
      sphinx
      sphinx-rtd-theme
    ];
    json = [
      orjson
      pandas
      pydantic
      pymongo
    ];
    multiprocessing = [ tqdm ];
    optional = dev ++ json ++ multiprocessing ++ serialization;
    serialization = [ msgpack ];
    task = [
      invoke
      requests
    ];
  };

  pythonImportsCheck = [ "monty" ];

  meta = {
    description = "Serves as a complement to the Python standard library by providing a suite of tools to solve many common problems";
    homepage = "https://github.com/materialsvirtuallab/monty";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

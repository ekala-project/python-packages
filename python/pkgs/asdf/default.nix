{
  lib,
  aiohttp,
  asdf-standard,
  asdf-transform-schemas,
  attrs,
  buildPythonPackage,
  fetchFromGitHub,
  fsspec,
  importlib-metadata,
  jmespath,
  lz4,
  numpy,
  packaging,
  psutil,
  pytest-remotedata,
  pyyaml,
  requests,
  semantic-version,
  setuptools,
  setuptools-scm,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "asdf";
  version = "5.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "asdf-format";
    repo = "asdf";
    tag = version;
    hash = "sha256-kvo53BT/jCnMj772GiwI2v0KTQcRVQqbYTRIOyS7PRM=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    asdf-standard
    asdf-transform-schemas
    importlib-metadata
    jmespath
    numpy
    packaging
    pyyaml
    semantic-version
    attrs
    typing-extensions
  ];
  pythonImportsCheck = [ "asdf" ];

  meta = {
    description = "Python tools to handle ASDF files";
    homepage = "https://github.com/asdf-format/asdf";
    license = lib.licenses.bsd3;
  };
}

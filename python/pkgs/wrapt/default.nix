{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "wrapt";
  version = "2.2.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "GrahamDumpleton";
    repo = "wrapt";
    tag = version;
    hash = "sha256-m3vjzV2aM4P+PoH3w9f8swLnp4DBLz5vfCz4An/XoMQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "wrapt" ];

  meta = {
    description = "Module for decorators, wrappers and monkey patching";
    homepage = "https://github.com/GrahamDumpleton/wrapt";
    license = lib.licenses.bsd2;
  };
}

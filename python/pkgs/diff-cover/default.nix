{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  poetry-core,

  # dependencies
  chardet,
  jinja2,
  jinja2-pluralize,
  pluggy,
  pygments,
  tomli,
}:

buildPythonPackage rec {
  pname = "diff_cover";
  version = "10.5.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-8clBfGIRHkCoHEgsaSxc3RMf+TMXuqmTBEyykZEuu6M=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    chardet
    jinja2
    jinja2-pluralize
    pluggy
    pygments
    tomli
  ];

  pythonImportsCheck = [ "diff_cover" ];

  meta = {
    description = "Automatically find diff lines that need test coverage";
    homepage = "https://github.com/Bachmann1234/diff-cover";
    license = lib.licenses.asl20;
  };
}

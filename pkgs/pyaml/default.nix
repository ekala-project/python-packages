{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pyyaml,
}:

buildPythonPackage rec {
  pname = "pyaml";
  version = "25.7.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-4ROmTsFogb8rCS4r64S33PG9mAlq0X9fFOj7eCp12Zs=";
  };

  build-system = [ setuptools ];

  dependencies = [ pyyaml ];

  pythonImportsCheck = [ "pyaml" ];

  meta = {
    description = "PyYAML-based module to produce pretty and readable YAML-serialized data";
    homepage = "https://github.com/mk-fg/pretty-yaml";
    license = lib.licenses.wtfpl;
  };
}

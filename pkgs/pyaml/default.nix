{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  pyyaml,
}:

buildPythonPackage rec {
  pname = "pyaml";
  version = "26.7.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Ec2jp5bvxtvODVaDa+Vs/SYona0HvNeOmQQIZymSnJM=";
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

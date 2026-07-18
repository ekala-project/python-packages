{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  beautifulsoup4,
  lxml,
}:

buildPythonPackage rec {
  pname = "micawber";
  version = "0.6.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-zATBml4Os2FbjNldWu/a1c3k9SphwS1FBxcn3+Ext2A=";
  };

  build-system = [ setuptools ];

  dependencies = [
    beautifulsoup4
    lxml
  ];

  pythonImportsCheck = [ "micawber" ];

  meta = {
    description = "Module for extracting rich content from URLs";
    homepage = "https://micawber.readthedocs.io/en/latest/";
    license = lib.licenses.mit;
  };
}

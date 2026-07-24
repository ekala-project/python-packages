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
  version = "0.7.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-q5xZx1ac/Eh902fcTtoT45S6UhbhnQLxhxrFbQoaGUQ=";
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

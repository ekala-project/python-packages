{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  six,
  beautifulsoup4,
  lxml,
}:

buildPythonPackage rec {
  pname = "ofxparse";
  version = "0.21";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "19y4sp5l9jqiqzzlbqdfiab42qx7d84n4xm4s7jfq397666vcyh5";
  };

  build-system = [ setuptools ];

  dependencies = [
    six
    beautifulsoup4
    lxml
  ];

  meta = {
    homepage = "http://sites.google.com/site/ofxparse";
    description = "Tools for working with the OFX (Open Financial Exchange) file format";
    license = lib.licenses.mit;
  };
}

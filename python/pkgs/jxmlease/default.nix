{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  lxml,
  unittestCheckHook,
}:

buildPythonPackage rec {
  pname = "jxmlease";
  version = "1.0.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "17l3w3ak07p72s8kv8hg0ilxs0kkxjn7bfwnl3g2cw58v1siab31";
  };

  build-system = [ setuptools ];

  dependencies = [ lxml ];

  # tests broken in expat bump
  # https://github.com/Juniper/jxmlease/issues/26
  unittestFlagsArray = [ "-v" ];

  meta = {
    description = "Converts between XML and intelligent Python data structures";
    homepage = "https://github.com/Juniper/jxmlease";
    license = lib.licenses.mit;
  };
}

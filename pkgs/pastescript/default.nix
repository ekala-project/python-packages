{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  paste,
  pastedeploy,
  six,
}:

buildPythonPackage rec {
  pname = "pastescript";
  version = "3.7.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-U28CjftuUynGezIpnhyTA/kSZOSXk8xpFusKc+tKJSE=";
  };

  build-system = [ setuptools ];

  dependencies = [
    paste
    pastedeploy
    six
  ];

  pythonImportsCheck = [ "paste.script" ];

  meta = {
    description = "Pluggable command-line frontend";
    homepage = "https://github.com/cdent/pastescript/";
    license = lib.licenses.mit;
  };
}

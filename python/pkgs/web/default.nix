{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  cheroot,
  legacy-cgi,
}:

buildPythonPackage rec {
  pname = "web.py";
  version = "0.62";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-XOaEyqJAZUyuWVDai0t7wXiBIDHgj5kFGNByvUSrUl4=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cheroot
    legacy-cgi
  ];

  pythonImportsCheck = [ "web" ];

  meta = {
    description = "Makes web apps";
    homepage = "https://webpy.org/";
    license = lib.licenses.publicDomain;
  };
}

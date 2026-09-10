{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage rec {
  pname = "xmod";
  version = "1.10.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-tAsqVNVmhLAeuWJ4krDBeZGOjvC9TX87rHo/26Ec1uY=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "xmod" ];

  meta = {
    description = "Turn any object into a module";
    homepage = "https://github.com/rec/xmod";
    license = lib.licenses.mit;
  };
}

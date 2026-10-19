{
  lib,
  buildPythonPackage,
  fetchPypi,
  drawille,
  matplotlib,
}:

buildPythonPackage rec {
  pname = "drawilleplot";
  version = "0.1.0";

  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ZEDroo7KkI2VxdESb2QDX+dPY4UahuuK9L0EddrxJjQ=";
  };

  dependencies = [
    drawille
    matplotlib
  ];

  pythonImportsCheck = [ "drawilleplot" ];

  meta = {
    description = "Matplotlib backend for graph output in unicode terminals using drawille";
    homepage = "https://github.com/gooofy/drawilleplot";
    license = lib.licenses.asl20;
    platforms = lib.platforms.all;
  };
}

{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  pillow,
}:

buildPythonPackage rec {
  pname = "aafigure";
  version = "0.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-SfLB/StXnB//usE4aiZws/b0dcx/9swE2LmEiIwtnh4=";
  };

  build-system = [ setuptools ];

  patchPhase = ''
    sed -i "s|/usr/share/fonts|/nonexisting-fonts-path|" aafigure/PILhelper.py
  '';

  dependencies = [ pillow ];

  pythonImportsCheck = [ "aafigure" ];

  meta = {
    description = "ASCII art to image converter";
    homepage = "https://launchpad.net/aafigure/";
    license = lib.licenses.bsd2;
  };
}

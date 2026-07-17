{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  importlib-metadata,
}:

buildPythonPackage rec {
  pname = "pygal";
  version = "3.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-+97nNRp0I+eQf7ipw7dzBfa1Z4yy5v0Ns2qIJeQpVew=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace-fail pytest-runner ""
  '';

  build-system = [ setuptools ];

  dependencies = [ importlib-metadata ];

  doCheck = false;

  pythonImportsCheck = [ "pygal" ];

  meta = {
    description = "Module for dynamic SVG charting";
    homepage = "http://www.pygal.org";
    license = lib.licenses.lgpl3Plus;
  };
}

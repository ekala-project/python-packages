{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  importlib-metadata,
}:

buildPythonPackage (finalAttrs: {
  pname = "pygal";
  version = "3.1.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-3RGcFM3rVr64UoLj4mh+zjBWEiXUEKgi5rtoaZqm57E=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace-fail pytest-runner ""
  '';

  build-system = [ setuptools ];

  dependencies = [ importlib-metadata ];

  pythonImportsCheck = [ "pygal" ];

  meta = {
    description = "Module for dynamic SVG charting";
    homepage = "http://www.pygal.org";
    license = lib.licenses.lgpl3Plus;
  };
})

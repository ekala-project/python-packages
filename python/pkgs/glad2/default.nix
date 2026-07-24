{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  jinja2,
}:

buildPythonPackage rec {
  pname = "glad2";
  version = "2.0.8";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-uEB5ufpATzcXG5Yb3R2NohNw5sgY3vuEgcWz/j1kNto=";
  };

  build-system = [ setuptools ];

  dependencies = [ jinja2 ];

  pythonImportsCheck = [ "glad" ];

  meta = {
    description = "Multi-Language GL/GLES/EGL/GLX/WGL Loader-Generator";
    homepage = "https://github.com/Dav1dde/glad";
    license = lib.licenses.mit;
  };
}

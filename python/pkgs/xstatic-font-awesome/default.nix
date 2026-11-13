{
  buildPythonPackage,
  lib,
  fetchPypi,
  setuptools_80,
}:

buildPythonPackage (finalAttrs: {
  pname = "xstatic-font-awesome";
  version = "6.2.1.2";
  pyproject = true;

  src = fetchPypi {
    pname = "xstatic_font_awesome";
    inherit (finalAttrs) version;
    hash = "sha256-nzyy8Dj619NSciN10/Ja80banuCT7Z3CyMRr2RGrGXE=";
  };

  # xstatic uses pkg_resources.declare_namespace, removed in setuptools 83.
  build-system = [ setuptools_80 ];

  # no tests implemented

  meta = {
    homepage = "https://github.com/python-xstatic/font-awesome";
    description = "Font Awesome packaged for python";
    license = lib.licenses.ofl;
  };
})

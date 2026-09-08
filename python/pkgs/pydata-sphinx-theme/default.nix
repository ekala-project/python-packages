{
  lib,
  buildPythonPackage,
  fetchPypi,
  sphinx,
  accessible-pygments,
  beautifulsoup4,
  docutils,
  packaging,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "pydata-sphinx-theme";
  version = "0.21.0";

  format = "wheel";

  src = fetchPypi {
    inherit version;
    format = "wheel";
    dist = "py3";
    python = "py3";
    pname = "pydata_sphinx_theme";
    hash = "sha256-02p1S/lYCwF4nvqKAYafLXyH+mxUPsvK+xS2vdQ2T5A=";
  };

  propagatedBuildInputs = [
    sphinx
    accessible-pygments
    beautifulsoup4
    docutils
    packaging
    typing-extensions
  ];

  pythonImportsCheck = [ "pydata_sphinx_theme" ];

  meta = {
    description = "Bootstrap-based Sphinx theme from the PyData community";
    homepage = "https://github.com/pydata/pydata-sphinx-theme";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}

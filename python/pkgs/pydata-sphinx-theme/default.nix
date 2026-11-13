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

buildPythonPackage (finalAttrs: {
  pname = "pydata-sphinx-theme";
  version = "0.24.0";

  format = "wheel";

  src = fetchPypi {
    inherit (finalAttrs) version;
    format = "wheel";
    dist = "py3";
    python = "py3";
    pname = "pydata_sphinx_theme";
    hash = "sha256-GVvBZ6sdzwsxA34m8UX2BGHcnLsesgESg1ZVZ+5PtuU=";
  };

  dependencies = [
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
  };
})

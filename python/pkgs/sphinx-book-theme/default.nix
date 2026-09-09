{
  lib,
  buildPythonPackage,
  fetchPypi,
  sphinx,
  pydata-sphinx-theme,
}:

buildPythonPackage rec {
  pname = "sphinx-book-theme";
  version = "1.4.0";

  format = "wheel";

  src = fetchPypi {
    inherit version;
    format = "wheel";
    dist = "py3";
    python = "py3";
    pname = "sphinx_book_theme";
    hash = "sha256-EP1X1mfuC1ZZKMPOlVYuKBxdG5S9Wiqvxc1BpdSY3NA=";
  };

  dependencies = [
    pydata-sphinx-theme
    sphinx
  ];

  pythonImportsCheck = [ "sphinx_book_theme" ];
  meta = {
    description = "Clean book theme for scientific explanations and documentation with Sphinx";
    homepage = "https://github.com/executablebooks/sphinx-book-theme";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}

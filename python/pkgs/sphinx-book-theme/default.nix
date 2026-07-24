{
  lib,
  buildPythonPackage,
  fetchPypi,
  sphinx,
  pydata-sphinx-theme,
  jupyter-book,
}:

buildPythonPackage rec {
  pname = "sphinx-book-theme";
  version = "1.2.0";

  format = "wheel";

  src = fetchPypi {
    inherit version;
    format = "wheel";
    dist = "py3";
    python = "py3";
    pname = "sphinx_book_theme";
    hash = "sha256-cJYF0wjhmRxe8M8ZxIHb6QhLYoUuMX+vq3Q4Kg7nzPo=";
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

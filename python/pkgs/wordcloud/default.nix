{
  lib,
  buildPythonPackage,
  cython,
  fetchPypi,
  matplotlib,
  numpy,
  pillow,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "wordcloud";
  version = "1.9.6";

  pyproject = true;

  build-system = [
    setuptools
    setuptools-scm
  ];

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-3xfEaP+QO9CrpPh8ZUB0XROkkxIg3Uk3yzY62FpHcbk=";
  };

  nativeBuildInputs = [ cython ];

  dependencies = [
    matplotlib
    numpy
    pillow
  ];
  pythonImportsCheck = [ "wordcloud" ];
  meta = {
    description = "Word cloud generator in Python";
    mainProgram = "wordcloud_cli";
    homepage = "https://github.com/amueller/word_cloud";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

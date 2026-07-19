{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,

  # dependencies
  levenshtein,
}:

buildPythonPackage rec {
  pname = "fuzzywuzzy";
  version = "0.18.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-RQFukiZHgOWJctyhs9k5rIZLeEN0Ir7s67MJX479AOg=";
  };

  build-system = [ setuptools ];

  dependencies = [ levenshtein ];

  pythonImportsCheck = [ "fuzzywuzzy" ];

  meta = {
    description = "Fuzzy string matching for Python";
    homepage = "https://github.com/seatgeek/fuzzywuzzy";
    license = lib.licenses.gpl2Only;
  };
}

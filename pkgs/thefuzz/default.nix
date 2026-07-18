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
  pname = "thefuzz";
  version = "0.22.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-cTgDmn7PVA2jI3kthZLvmQKx1563jBR9TyBmTeefNoA=";
  };

  build-system = [ setuptools ];

  dependencies = [ levenshtein ];

  pythonImportsCheck = [ "thefuzz" ];

  meta = {
    description = "Fuzzy string matching for Python";
    homepage = "https://github.com/seatgeek/thefuzz";
    license = lib.licenses.gpl2Only;
  };
}

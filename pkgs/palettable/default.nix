{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "palettable";
  version = "3.3.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-CU3X2aX8HMpIVHc+XB/GoxWzO9WzqPRwZJKPrK8EkKg=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "palettable" ];

  meta = {
    description = "Library of color palettes";
    homepage = "https://jiffyclub.github.io/palettable/";
    license = lib.licenses.mit;
  };
}

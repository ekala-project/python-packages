{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage rec {
  pname = "cssselect";
  version = "1.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-PL6C3XrL7pup5XI7X55HSYJpEvH7Mc1/kqq+1f3hWxU=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "cssselect" ];

  meta = {
    description = "CSS Selectors for Python";
    homepage = "https://cssselect.readthedocs.io/";
    license = lib.licenses.bsd3;
  };
}

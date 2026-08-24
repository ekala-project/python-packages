{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "zodbpickle";
  version = "4.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-efM8xJoJsoqLO0A2nBQhboBXF364x+iY12r9azGUy3g=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "zodbpickle" ];

  meta = {
    description = "Fork of Python's pickle module to work with ZODB";
    homepage = "https://github.com/zopefoundation/zodbpickle";
    license = with lib.licenses; [
      psfl
      zpl21
    ];
    maintainers = [ ];
  };
}

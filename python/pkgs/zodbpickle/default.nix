{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "zodbpickle";
  version = "4.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Z9QpXdtoskEP5BcJT/4aiw7UGDTuMIAg9Y7htjPh91E=";
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
  };
}

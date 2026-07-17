{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage rec {
  pname = "atpublic";
  version = "5.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-1ctsur8A7B004oLozny8m3S6TLcy52bCTi140a1/cj8=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "public" ];

  meta = {
    description = "Python decorator and function which populates a module's __all__ and globals";
    homepage = "https://public.readthedocs.io/";
    license = lib.licenses.asl20;
  };
}

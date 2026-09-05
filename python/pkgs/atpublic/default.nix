{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage rec {
  pname = "atpublic";
  version = "8.0.0a1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-e9s+g9p6bnQdDH7m0nFDRnxoxXJ34f/q/oAEJZZ+ozM=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "public" ];

  meta = {
    description = "Python decorator and function which populates a module's __all__ and globals";
    homepage = "https://public.readthedocs.io/";
    license = lib.licenses.asl20;
  };
}

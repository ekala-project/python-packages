{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "atpublic";
  version = "9.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-Yepi2ERdKqqDtt/6o9kPmfzsEOFmg+6bE3ks3Nr6CWY=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "public" ];

  meta = {
    description = "Python decorator and function which populates a module's __all__ and globals";
    homepage = "https://public.readthedocs.io/";
    license = lib.licenses.asl20;
  };
})

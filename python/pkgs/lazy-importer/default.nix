{
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "lazy-importer";
  version = "0.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "lazy_importer";
    inherit (finalAttrs) version;
    hash = "sha256-suKWcWzgFcDNgOV7lA5Scnxbk0s0uGVtXOBr3Q7l+90=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "lazy_importer" ];

  meta = {
    description = "Context manager for portable, opt-in lazy imports";
    homepage = "https://pypi.org/project/lazy-importer/";
    license = lib.licenses.asl20;
  };
})

{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  pyyaml,
}:

buildPythonPackage (finalAttrs: {
  pname = "dtfabric";
  version = "20260506";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-n/z2OD3vZrEKoYC3eRVIx6XpgKwTbTaKqp2O2cg11fs=";
  };

  build-system = [ setuptools ];

  pythonRemoveDeps = [ "pip" ];

  dependencies = [ pyyaml ];

  pythonImportsCheck = [ "dtfabric" ];

  meta = {
    description = "Project to manage data types and structures";
    homepage = "https://github.com/libyal/dtfabric";
    license = lib.licenses.asl20;
  };
})

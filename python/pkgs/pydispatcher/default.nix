{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pydispatcher";
  version = "3.0.0a2";
  pyproject = true;

  src = fetchPypi {
    pname = "pydispatcher";
    inherit (finalAttrs) version;
    hash = "sha256-FeQxqECzIO4YZ7oTWs9imLGpW9mCJFj40ajOt4JRGX4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pydispatch" ];

  meta = {
    homepage = "https://pydispatcher.sourceforge.net/";
    description = "Multi-producer multi-consumer signal dispatching mechanism";
    license = lib.licenses.bsd3;
  };
})

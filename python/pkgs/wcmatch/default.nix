{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  bracex,
}:

buildPythonPackage (finalAttrs: {
  pname = "wcmatch";
  version = "12.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-Tqas73W2V79xrI+pUgFlv1rlUSDE5lWJWlt9TGmJbF4=";
  };

  build-system = [ hatchling ];

  dependencies = [ bracex ];

  pythonImportsCheck = [ "wcmatch" ];

  meta = {
    homepage = "https://github.com/facelessuser/wcmatch";
    description = "Wilcard File Name matching library";
    license = lib.licenses.mit;
  };
})

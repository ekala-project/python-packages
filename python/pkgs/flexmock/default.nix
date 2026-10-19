{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "flexmock";
  version = "0.13.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-aCnXoNf3Rtswh9qP2mL5JOUt9+zkBRwvWa1YbPWteXc=";
  };

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "flexmock" ];

  meta = {
    homepage = "https://flexmock.readthedocs.org";
    description = "Testing library that makes it easy to create mocks, stubs and fakes";
    license = lib.licenses.bsdOriginal;
  };
})

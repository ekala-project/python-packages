{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytimeparse";
  version = "1.1.8";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-6GE2R3vpJNfmcGRqmFYZV+jKcwjUSEHiH13ep1dVago=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pytimeparse" ];

  meta = {
    description = "Library to parse various kinds of time expressions";
    homepage = "https://github.com/wroberts/pytimeparse";
    license = lib.licenses.mit;
  };
})

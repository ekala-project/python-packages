{
  lib,
  aiohttp,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "asyncsleepiq";
  version = "1.9.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-W/nUccq7SLgxz8WEFlPYXCaHy9F0GLjXq7KNt2kpe1k=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [ aiohttp ];

  # upstream has no tests

  pythonImportsCheck = [ "asyncsleepiq" ];

  meta = {
    description = "Async interface to SleepIQ API";
    homepage = "https://github.com/kbickar/asyncsleepiq";
    license = lib.licenses.mit;
  };
})

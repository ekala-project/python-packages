{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  inversion,
}:

buildPythonPackage (finalAttrs: {
  pname = "verspec";
  version = "0.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-IEbqFlvgGz/0qMIxnQztV7HXZz+wWzinU2dTGs3jtTQ=";
  };

  build-system = [ setuptools ];

  dependencies = [ inversion ];

  pythonImportsCheck = [ "verspec" ];

  meta = {
    description = "Flexible version handling";
    homepage = "https://github.com/jimporter/verspec";
    license = lib.licenses.bsd2;
  };
})

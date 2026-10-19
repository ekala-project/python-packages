{
  lib,
  buildPythonPackage,
  fetchPypi,
  pint,
  pytest-cov-stub,
  setuptools,
  toml,
}:

buildPythonPackage (finalAttrs: {
  pname = "vulture";
  version = "2.16";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-+Nn24q8DARZko8bCQMl2Wz85KRfTE1/dym1qaNNZ9xc=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "vulture" ];

  meta = {
    description = "Finds unused code in Python programs";
    homepage = "https://github.com/jendrikseipp/vulture";
    license = lib.licenses.mit;
    mainProgram = "vulture";
  };
})

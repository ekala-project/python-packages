{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "markuppy";
  version = "1.18";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-VA8xuDUHYmAzk2iJCsT0TrOXHXX9vZe0n6H4tmhVE9M=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "MarkupPy" ];

  meta = {
    homepage = "https://github.com/tylerbakke/MarkupPy";
    description = "HTML/XML generator";
    license = lib.licenses.mit;
  };
})

{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  pygments,
}:

buildPythonPackage (finalAttrs: {
  pname = "insegel";
  version = "1.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "1d055dd64f6eb335580a485271511ba2f4e3b5e315f48f827f58da3cace4b4ae";
  };

  build-system = [ setuptools ];

  dependencies = [ pygments ];

  # No tests included

  pythonImportsCheck = [ "insegel" ];

  meta = {
    homepage = "https://github.com/autophagy/insegel";
    description = "Monochrome 2 column Sphinx theme";
    license = lib.licenses.mit;
  };
})

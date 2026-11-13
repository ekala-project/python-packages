{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "munkres";
  version = "3.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-IfigS8KLNLvvw11K+CSz1w3i89N9ZV2goUdOXCujQb8=";
  };

  build-system = [ setuptools ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "munkres" ];

  meta = {
    homepage = "https://github.com/iameishit/Paldita-munkres";
    changelog = "https://github.com/iameishit/Paldita-munkres/blob/main/CHANGELOG.md";
    description = "Munkres (Hungarian) algorithm for the Assignment Problem";
    license = lib.licenses.asl20;
  };
})

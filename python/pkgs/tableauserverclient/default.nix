{
  lib,
  buildPythonPackage,
  defusedxml,
  fetchPypi,
  packaging,
  requests,
  requests-mock,
  setuptools,
  typing-extensions,
  versioneer,
}:

buildPythonPackage (finalAttrs: {
  pname = "tableauserverclient";
  version = "0.42";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-NHTeAGtLel31OegAu1EuebG8OCumMwkiK4OIghZkocM=";
  };

  pythonRelaxDeps = [
    "defusedxml"
    "urllib3"
  ];

  build-system = [
    setuptools
    versioneer
  ];

  dependencies = [
    defusedxml
    requests
    packaging
    typing-extensions
  ];
  # Tests attempt to create some file artifacts and fails

  pythonImportsCheck = [ "tableauserverclient" ];

  meta = {
    description = "Module for working with the Tableau Server REST API";
    homepage = "https://github.com/tableau/server-client-python";
    license = lib.licenses.mit;
  };
})

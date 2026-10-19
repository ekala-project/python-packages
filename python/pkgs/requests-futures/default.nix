{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "requests-futures";
  version = "1.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ross";
    repo = "requests-futures";
    tag = "v${finalAttrs.version}";
    hash = "sha256-eUu+M9rPyvc7OaOCCnUvGliK4gicYh6hfB0Jo19Yy1g=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  pythonImportsCheck = [ "requests_futures" ];

  meta = {
    description = "Asynchronous Python HTTP Requests for Humans using Futures";
    homepage = "https://github.com/ross/requests-futures";
    license = lib.licenses.asl20;
  };
})

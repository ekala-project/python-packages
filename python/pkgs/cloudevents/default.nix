{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pythonAtLeast,
  setuptools,
  deprecation,
  flask,
  pydantic,
  requests,
  sanic,
  sanic-testing,
}:

buildPythonPackage (finalAttrs: {
  pname = "cloudevents";
  version = "1.12.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "cloudevents";
    repo = "sdk-python";
    tag = finalAttrs.version;
    hash = "sha256-0WdCBwYz3XJWjUP0gf+IWdF4ZgPHFvUZFoQp9taqNz8=";
  };

  build-system = [ setuptools ];

  dependencies = [ deprecation ];

  pythonImportsCheck = [ "cloudevents" ];
  meta = {
    description = "Python SDK for CloudEvents";
    homepage = "https://github.com/cloudevents/sdk-python";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})

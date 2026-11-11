{
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
  requests,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "stripe";
  version = "16.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-IecrZ3m4z/M3yo0rjTATjy1o9qjXOXAQdvBqQYrXW4w=";
  };

  build-system = [ flit-core ];

  dependencies = [
    requests
    typing-extensions
  ];

  pythonImportsCheck = [ "stripe" ];

  meta = {
    description = "Stripe Python bindings";
    homepage = "https://github.com/stripe/stripe-python";
    license = lib.licenses.mit;
  };
})

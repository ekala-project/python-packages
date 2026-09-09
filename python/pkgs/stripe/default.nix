{
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
  requests,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "stripe";
  version = "15.6.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-nzmGqpYEGQQaupx2GRdGvfLDQslYkqz79u21AKsAbTE=";
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
}

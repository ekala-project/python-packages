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
  version = "15.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-/wVSQlX1G/ffDlvEqZ29D3N6/QVYe3ZXyC4Nmcf8RaQ=";
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

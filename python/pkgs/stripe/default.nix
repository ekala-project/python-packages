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
  version = "15.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-L5qNlh5cLsGRSftOC0fZcJ0BSmhZLNsfTv0ESryNI1k=";
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

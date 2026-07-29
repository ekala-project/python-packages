{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  requests,
  setuptools,
}:

buildPythonPackage rec {
  pname = "mercadopago";
  version = "2.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mercadopago";
    repo = "sdk-python";
    tag = version;
    hash = "sha256-AYgYGY55hhvVY1lB6anJvjRquDRiNoDnpOFTuVdQniM=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    requests
  ];

  # require internet
  doCheck = false;

  pythonImportsCheck = [ "mercadopago" ];

  meta = {
    description = "This library provides developers with a simple set of bindings to help you integrate Mercado Pago API to a website and start receiving payments";
    homepage = "https://www.mercadopago.com";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

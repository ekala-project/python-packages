{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  httpx,
  pyspnego,
}:

buildPythonPackage rec {
  pname = "httpx-ntlm";
  version = "1.4.0";
  pyproject = true;

  src = fetchPypi {
    pname = "httpx_ntlm";
    inherit version;
    hash = "sha256-Qb6KK6hRQ0hOYX3LkX1LGeOuEq/caIYipJAQNJk7U+Q=";
  };

  build-system = [ setuptools ];

  dependencies = [
    httpx
    pyspnego
  ];

  # https://github.com/ulodciv/httpx-ntlm/issues/5

  pythonImportsCheck = [ "httpx_ntlm" ];

  meta = {
    description = "NTLM authentication support for HTTPX";
    homepage = "https://github.com/ulodciv/httpx-ntlm";
    license = lib.licenses.isc;
  };
}

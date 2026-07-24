{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  requests,
  requests-toolbelt,
  pyparsing,
}:

buildPythonPackage rec {
  pname = "cloudscraper";
  version = "1.2.71";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-QpxuiqaRbVutXIperFDz6lPJrCJhb2yyGxjcxxUX0NM=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    requests-toolbelt
    pyparsing
  ];

  pythonImportsCheck = [ "cloudscraper" ];

  meta = {
    description = "Python module to bypass Cloudflare's anti-bot page";
    homepage = "https://github.com/venomous/cloudscraper";
    license = lib.licenses.mit;
  };
}

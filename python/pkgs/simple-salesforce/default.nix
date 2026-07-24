{
  lib,
  buildPythonPackage,
  cryptography,
  fetchFromGitHub,
  more-itertools,
  pendulum,
  pyjwt,
  pytest-cov-stub,
  pytz,
  requests,
  responses,
  setuptools,
  typing-extensions,
  zeep,
}:

buildPythonPackage (finalAttrs: {
  pname = "simple-salesforce";
  version = "1.12.10";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "simple-salesforce";
    repo = "simple-salesforce";
    tag = "v${finalAttrs.version}";
    hash = "sha256-6Aj4ha1OtYEr7CxXWvSjYDU88tNZE6Fz5oRYyVpWVPI=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [
    cryptography
    more-itertools
    pendulum
    pyjwt
    requests
    typing-extensions
    zeep
  ];
  pythonImportsCheck = [ "simple_salesforce" ];

  meta = {
    description = "Very simple Salesforce.com REST API client for Python";
    homepage = "https://github.com/simple-salesforce/simple-salesforce";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})

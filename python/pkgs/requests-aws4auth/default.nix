{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  httpx,
  requests,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "requests-aws4auth";
  version = "1.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tedder";
    repo = "requests-aws4auth";
    tag = "v${finalAttrs.version}";
    hash = "sha256-+DUWVtaHyMjL1Zl/7Bfzmi45dc7Vqk1EXfu/sCfMZuE=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  optional-dependencies = {
    httpx = [ httpx ];
  };

  pythonImportsCheck = [ "requests_aws4auth" ];

  meta = {
    description = "Amazon Web Services version 4 authentication for the Python Requests library";
    homepage = "https://github.com/sam-washington/requests-aws4auth";
    license = lib.licenses.mit;
  };
})

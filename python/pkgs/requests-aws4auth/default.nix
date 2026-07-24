{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  httpx,
  requests,
  setuptools,
}:

buildPythonPackage rec {
  pname = "requests-aws4auth";
  version = "1.3.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tedder";
    repo = "requests-aws4auth";
    tag = "v${version}";
    hash = "sha256-GIbv4/a1ZdcIOemanzDiueLcKg8pUVeIFSAfErIr0HI=";
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
}

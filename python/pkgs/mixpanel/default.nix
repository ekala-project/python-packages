{
  buildPythonPackage,
  fetchFromGitHub,
  lib,

  # build-system
  setuptools,

  # dependencies
  asgiref,
  httpx,
  pydantic,
  requests,

  # tests
  pytest-asyncio,
  responses,
  respx,
}:

buildPythonPackage rec {
  pname = "mixpanel";
  version = "5.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mixpanel";
    repo = "mixpanel-python";
    tag = "v${version}";
    hash = "sha256-0O/VPE9i/ka/pDnSA4jmKriT/jR2l6wqUjLmIesytww=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "pydantic" ];

  pythonRemoveDeps = [ "json-logic" ];

  dependencies = [
    asgiref
    httpx
    pydantic
    requests
  ];
  meta = {
    homepage = "https://github.com/mixpanel/mixpanel-python";
    description = "Official Mixpanel Python library";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}

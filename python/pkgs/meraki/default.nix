{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  httpx,
}:

buildPythonPackage (finalAttrs: {
  pname = "meraki";
  version = "4.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "meraki";
    repo = "dashboard-api-python";
    tag = finalAttrs.version;
    hash = "sha256-SYILd5epeB/V/fa+yxZvT49eHapZnqxcTW1s8gH3fAY=";
  };

  build-system = [ hatchling ];

  dependencies = [
    httpx
  ];

  # All tests require an API key

  pythonImportsCheck = [ "meraki" ];

  meta = {
    description = "Cisco Meraki cloud-managed platform dashboard API python library";
    homepage = "https://github.com/meraki/dashboard-api-python";
    license = lib.licenses.mit;
  };
})

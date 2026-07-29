{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "nexus-rpc";
  version = "1.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "nexus-rpc";
    repo = "sdk-python";
    tag = version;
    hash = "sha256-il+zCyU0dOlqFHGedyeBKgwQlqx1FLNuriGIw3RV3Gs=";
    fetchSubmodules = true;
  };

  build-system = [
    hatchling
  ];

  dependencies = [
    typing-extensions
  ];

  pythonImportsCheck = [
    "nexusrpc"
  ];

  meta = {
    description = "Nexus Python SDK";
    homepage = "https://temporal.io/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

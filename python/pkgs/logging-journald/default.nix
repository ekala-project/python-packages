{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
}:

buildPythonPackage rec {
  pname = "logging-journald";
  version = "0.6.12";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mosquito";
    repo = "logging-journald";
    tag = version;
    hash = "sha256-kR/ter0hr9t+f1yFG9dhE/CZz92ve64nBAMnvLosG9E=";
  };

  build-system = [ hatchling ];

  # Circular dependency with aiomisc
  doCheck = false;

  pythonImportsCheck = [ "logging_journald" ];

  meta = {
    description = "Logging handler for writing logs to the journald";
    homepage = "https://github.com/mosquito/logging-journald";
    license = lib.licenses.mit;
  };
}

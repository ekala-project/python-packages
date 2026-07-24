{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  deprecated,
  hatchling,
  importlib-metadata,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "opentelemetry-api";
  version = "1.44.0";
  pyproject = true;

  # to avoid breakage, every package in opentelemetry-python must inherit this version, src, and meta
  src = fetchFromGitHub {
    owner = "open-telemetry";
    repo = "opentelemetry-python";
    tag = "v${version}";
    hash = "sha256-e0JJL2fpDPDE/REyb0QptTYe4a6/smLrV88oKwOeG4M=";
  };

  sourceRoot = "${src.name}/opentelemetry-api";

  build-system = [ hatchling ];

  dependencies = [
    deprecated
    importlib-metadata
    typing-extensions
  ];

  pythonRelaxDeps = [ "importlib-metadata" ];

  pythonImportsCheck = [ "opentelemetry" ];

  doCheck = false;

  meta = {
    homepage = "https://github.com/open-telemetry/opentelemetry-python/tree/main/opentelemetry-api";
    description = "OpenTelemetry Python API";
    license = lib.licenses.asl20;
  };
}

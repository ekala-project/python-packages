{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  asgiref,
}:

buildPythonPackage (finalAttrs: {
  pname = "prometheus-client";
  version = "0.26.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "prometheus";
    repo = "client_python";
    tag = "v${finalAttrs.version}";
    hash = "sha256-LCWfgd6c77HSlrA7vHbtEZACh+4bXtxyUIxjODOhYCs=";
  };

  build-system = [ setuptools ];

  dependencies = [ asgiref ];

  __darwinAllowLocalNetworking = true;

  pythonImportsCheck = [ "prometheus_client" ];

  meta = {
    description = "Prometheus instrumentation library for Python applications";
    homepage = "https://github.com/prometheus/client_python";
    license = lib.licenses.asl20;
  };
})

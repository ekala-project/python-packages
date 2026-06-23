{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  asgiref,
  twisted,
}:

buildPythonPackage (finalAttrs: {
  pname = "prometheus-client";
  version = "0.25.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "prometheus";
    repo = "client_python";
    tag = "v${finalAttrs.version}";
    hash = "sha256-vue/5ulOnKkYjiHYWgT6HZ5mhV2vqAstm44+zwm+po0=";
  };

  build-system = [ setuptools ];

  dependencies = [ asgiref ];

  optional-dependencies.twisted = [ twisted ];

  __darwinAllowLocalNetworking = true;

  pythonImportsCheck = [ "prometheus_client" ];

  meta = {
    description = "Prometheus instrumentation library for Python applications";
    homepage = "https://github.com/prometheus/client_python";
    license = lib.licenses.asl20;
  };
})

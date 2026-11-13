{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  azure-core,
  azure-identity,
  azure-storage-blob,
  httpx2,
  openai,
  isodate,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "azure-ai-projects";
  version = "2.11.0";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_ai_projects";
    inherit (finalAttrs) version;
    hash = "sha256-7aNA2nyr/9CwW0tbuMbIpbelqPyklXhaEJfy/sjBU/g=";
  };

  build-system = [
    setuptools
    wheel
  ];

  dependencies = [
    azure-core
    azure-identity
    azure-storage-blob
    httpx2
    openai
    isodate
    typing-extensions
  ];

  # requires openai>=3.0.0; only openai 2.x is packaged
  pythonRelaxDeps = [ "openai" ];

  pythonImportsCheck = [
    "azure.ai.projects"
  ];

  meta = {
    description = "Microsoft Azure AI Projects Client Library for Python";
    homepage = "https://pypi.org/project/azure-ai-projects/#history";
    license = lib.licenses.mit;
  };
})

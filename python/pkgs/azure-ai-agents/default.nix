{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  wheel,
  azure-core,
  isodate,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "azure-ai-agents";
  version = "1.2.0b6";
  pyproject = true;

  src = fetchPypi {
    pname = "azure_ai_agents";
    inherit version;
    hash = "sha256-08EISMOxneyYopL4wQzuS6SqwQUNT6q/nC4kVrcn9Sg=";
  };

  build-system = [
    setuptools
    wheel
  ];

  dependencies = [
    azure-core
    isodate
    typing-extensions
  ];

  pythonImportsCheck = [
    "azure.ai.agents"
  ];

  meta = {
    description = "Microsoft Corporation Azure AI Agents Client Library for Python";
    homepage = "https://pypi.org/project/azure-ai-agents";
    license = lib.licenses.mit;
  };
}

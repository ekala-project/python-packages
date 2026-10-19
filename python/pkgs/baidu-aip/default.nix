{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  chardet,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "baidu-aip";
  version = "4.16.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-zNYjEVVwhqFAR7w7CR3rWYefUZcM+sPZ87KYfDDLxN0=";
  };

  build-system = [ setuptools ];

  dependencies = [
    chardet
    requests
  ];

  # Package has no tests

  pythonImportsCheck = [ "aip" ];

  meta = {
    description = "Baidu AI Platform SDK for Python";
    homepage = "https://github.com/Baidu-AIP/python-sdk";
    license = lib.licenses.asl20;
  };
})

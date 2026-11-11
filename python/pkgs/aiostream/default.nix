{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "aiostream";
  version = "0.8.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-MtGAtKsB67L8We2n+ln0lolaTQezL8V1N9Ha3iUUqKE=";
  };

  build-system = [ setuptools ];

  dependencies = [ typing-extensions ];

  pythonImportsCheck = [ "aiostream" ];

  meta = {
    description = "Generator-based operators for asynchronous iteration";
    homepage = "https://aiostream.readthedocs.io";
    license = lib.licenses.gpl3Only;
  };
})

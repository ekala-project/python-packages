{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "aiostream";
  version = "0.7.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-JyqqDY+DvrkG9aqQIrtZBGu3oQP6N3D4B8MfkYWVrPY=";
  };

  build-system = [ setuptools ];

  dependencies = [ typing-extensions ];

  pythonImportsCheck = [ "aiostream" ];

  meta = {
    description = "Generator-based operators for asynchronous iteration";
    homepage = "https://aiostream.readthedocs.io";
    license = lib.licenses.gpl3Only;
  };
}

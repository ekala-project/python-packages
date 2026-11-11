{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  simple-websocket,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-engineio";
  version = "4.15.1";
  pyproject = true;

  src = fetchPypi {
    pname = "python_engineio";
    inherit (finalAttrs) version;
    hash = "sha256-GkEueYqQxk+r57IHmJOa5tSgPzTaijPVoholqLu8NhI=";
  };

  build-system = [ setuptools ];

  dependencies = [ simple-websocket ];

  pythonImportsCheck = [ "engineio" ];

  meta = {
    description = "Python based Engine.IO client and server";
    homepage = "https://github.com/miguelgrinberg/python-engineio/";
    license = lib.licenses.mit;
  };
})

{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  flask,
}:

buildPythonPackage (finalAttrs: {
  pname = "flask-httpauth";
  version = "4.8.1";
  pyproject = true;

  src = fetchPypi {
    pname = "flask_httpauth";
    inherit (finalAttrs) version;
    hash = "sha256-iEmbIvE1OJN0PDzWjyylYcStnvdc1rzH9iEWHNDoB0Q=";
  };

  build-system = [ setuptools ];

  dependencies = [ flask ];

  pythonImportsCheck = [ "flask_httpauth" ];

  meta = {
    homepage = "https://github.com/miguelgrinberg/Flask-HTTPAuth";
    description = "Extension that provides HTTP authentication for Flask routes";
    license = lib.licenses.mit;
  };
})

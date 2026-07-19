{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "dj-email-url";
  version = "1.0.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Vf/jMp5I9U+Kdao27OCPNl4J1h+KIJdz7wmh1HYOaZo=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "dj_email_url" ];

  meta = {
    description = "Use an URL to configure email backend settings in your Django Application";
    homepage = "https://github.com/migonzalvar/dj-email-url";
    license = lib.licenses.bsd0;
  };
}

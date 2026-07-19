{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
  babel,
  flask,
  jinja2,
  pytz,
}:

buildPythonPackage rec {
  pname = "flask-babel";
  version = "4.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "flask_babel";
    inherit version;
    hash = "sha256-2+q0Ano/SodnihFoZJbpjhSS63k8vdd6tQ9OmiYCpZM=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    babel
    flask
    jinja2
    pytz
  ];

  pythonImportsCheck = [ "flask_babel" ];

  doCheck = false;

  meta = {
    homepage = "https://github.com/python-babel/flask-babel";
    description = "Adds i18n/l10n support to Flask applications";
    license = lib.licenses.bsd2;
  };
}

{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  celery,
  humanize,
  prometheus-client,
  pytz,
  tornado,
}:

buildPythonPackage rec {
  pname = "flower";
  version = "2.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-WrcXuXlTB3DBavtItQ0qmNI8Pp/jmFHc9rxNAYRaAqA=";
  };

  build-system = [ setuptools ];

  dependencies = [
    celery
    humanize
    prometheus-client
    pytz
    tornado
  ];

  pythonImportsCheck = [ "flower" ];

  meta = {
    description = "Real-time monitor and web admin for Celery distributed task queue";
    homepage = "https://github.com/mher/flower";
    license = lib.licenses.bsdOriginal;
  };
}

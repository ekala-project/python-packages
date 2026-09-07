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
  version = "2.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-7Oef0ZC/0ZiUfjBHDEsmptXfGGHVQwlDDdkm7VFjAv8=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "tornado" ];

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

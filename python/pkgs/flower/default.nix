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

buildPythonPackage (finalAttrs: {
  pname = "flower";
  version = "2.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-xPR1GUL/i1Bp5mBKE24HO4YJcbdliFm9xh2h3BekuzI=";
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
})

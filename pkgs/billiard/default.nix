{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "billiard";
  version = "4.2.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "celery";
    repo = "billiard";
    tag = "v${version}";
    hash = "sha256-7DwS3fdYhMNVYR0RIoMFyxNpj56VrGlbF4mIgLKPrOQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "billiard" ];

  meta = {
    description = "Python multiprocessing fork with improvements and bugfixes";
    homepage = "https://github.com/celery/billiard";
    license = lib.licenses.bsd3;
  };
}

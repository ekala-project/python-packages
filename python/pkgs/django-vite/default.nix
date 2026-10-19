{
  lib,
  fetchFromGitHub,
  # build-system
  setuptools,
  buildPythonPackage,
  django,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-vite";
  version = "3.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "MrBin99";
    repo = "django-vite";
    tag = finalAttrs.version;
    hash = "sha256-S5DpU0Sw0TOY1SNici6djeTrvg4gehH/a2UCzju1e/s=";
  };

  build-system = [ setuptools ];

  dependencies = [ django ];

  # Package doesn’t have any tests

  pythonImportsCheck = [ "django_vite" ];

  meta = {
    description = "Integration of ViteJS in a Django project";
    homepage = "https://github.com/MrBin99/django-vite";
    license = lib.licenses.asl20;
  };
})

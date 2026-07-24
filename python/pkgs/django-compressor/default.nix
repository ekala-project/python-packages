{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  django,
  django-appconf,
  rcssmin,
  rjsmin,

  # tests
  beautifulsoup4,
  brotli,
  csscompressor,
  django-sekizai,
  jinja2,
  pytest-django,

}:

buildPythonPackage rec {
  pname = "django-compressor";
  version = "4.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "django-compressor";
    repo = "django-compressor";
    tag = version;
    hash = "sha256-ymht/nl3UUFXLc54aqDADXArVG6jUNQppBJCNKp2P68=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    django
    django-appconf
    rcssmin
    rjsmin
  ];

  env.DJANGO_SETTINGS_MODULE = "compressor.test_settings";
  # Getting error: compressor.exceptions.OfflineGenerationError: You have
  # offline compression enabled but key "..." is missing from offline manifest.
  # You may need to run "python manage.py compress"
  pythonImportsCheck = [ "compressor" ];

  meta = {
    description = "Compresses linked and inline JavaScript or CSS into single cached files";
    homepage = "https://django-compressor.readthedocs.org/";
    license = lib.licenses.mit;
  };
}

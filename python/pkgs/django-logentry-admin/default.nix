{
  lib,
  fetchFromGitHub,
  # build-system
  setuptools,
  buildPythonPackage,
  django,
  pytest,
  pytest-django,
}:

buildPythonPackage rec {
  pname = "django-logentry-admin";
  version = "1.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "yprez";
    repo = "django-logentry-admin";
    tag = "v${version}";
    sha256 = "1bndxgvisw8kk52zfdifvly6dl4833wqilxf77pg473172yaf5gq";
  };

  build-system = [ setuptools ];

  nativeCheckInputs = [
    pytest
    pytest-django
  ];
  checkPhase = ''
    rm -r logentry_admin __init__.py
    pytest
  '';

  dependencies = [ django ];

  meta = {
    description = "Show all LogEntry objects in the Django admin site";
    homepage = "https://github.com/yprez/django-logentry-admin";
    license = lib.licenses.isc;
  };
}

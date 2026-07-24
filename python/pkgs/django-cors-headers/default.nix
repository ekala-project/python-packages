{
  lib,
  asgiref,
  buildPythonPackage,
  django,
  fetchFromGitHub,
  pytest-django,
  setuptools,
}:

buildPythonPackage rec {
  pname = "django-cors-headers";
  version = "4.9.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "adamchainz";
    repo = "django-cors-headers";
    tag = version;
    hash = "sha256-YtBMTmUOqozJksUgF4XJO+cQaFVt49qa0YKHlcXM1nU=";
  };

  build-system = [ setuptools ];

  dependencies = [
    asgiref
    django
  ];
  pythonImportsCheck = [ "corsheaders" ];

  meta = {
    description = "Django app for handling server Cross-Origin Resource Sharing (CORS) headers";
    homepage = "https://github.com/OttoYiu/django-cors-headers";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

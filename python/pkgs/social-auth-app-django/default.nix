{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  django,
  social-auth-core,
  pytest-django,
}:

buildPythonPackage rec {
  pname = "social-auth-app-django";
  version = "6.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-social-auth";
    repo = "social-app-django";
    tag = version;
    hash = "sha256-5aZQcGPX93XITzJCgL+s5Jxep+qqVbYGvzMXDRpZXdY=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "social-auth-core" ];

  dependencies = [
    django
    social-auth-core
  ];

  pythonImportsCheck = [ "social_django" ];
  meta = {
    broken = lib.versionOlder django.version "5.1";
    description = "Module for social authentication/registration mechanism";
    homepage = "https://github.com/python-social-auth/social-app-django";
    license = lib.licenses.bsd3;
  };
}

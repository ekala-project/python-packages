{
  lib,
  buildPythonPackage,
  django,
  fetchFromGitHub,
  flit-core,
  psycopg2,
  pydantic,
  pytest-asyncio,
  pytest-django,
}:

buildPythonPackage rec {
  pname = "django-ninja";
  version = "1.7.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "vitalik";
    repo = "django-ninja";
    tag = "v${version}";
    hash = "sha256-rfusPDZj056NX3lOs+hImuedknGR08Fkv+EuN9sTcIE=";
  };

  build-system = [ flit-core ];

  dependencies = [
    django
    pydantic
  ];
  meta = {
    description = "Web framework for building APIs with Django and Python type hints";
    homepage = "https://django-ninja.dev";
    license = lib.licenses.mit;
  };
}

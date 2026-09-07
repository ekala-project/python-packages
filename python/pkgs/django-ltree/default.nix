{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  django,
}:

buildPythonPackage (finalAttrs: {
  pname = "django-ltree";
  version = "0.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mariocesar";
    repo = "django-ltree";
    tag = "v${finalAttrs.version}";
    hash = "sha256-SStxvxPpdIuEWNkly1sOwF9Chpc/IE4zawIotKbwZSw=";
  };

  build-system = [
    hatchling
  ];

  dependencies = [
    django
  ];

  pythonImportsCheck = [
    "django_ltree"
  ];

  meta = {
    description = "An ltree extension implementation to support hierarchical tree-like data using the native Postgres extension ltree in django models";
    homepage = "https://github.com/mariocesar/django-ltree";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})

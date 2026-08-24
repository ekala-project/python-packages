{
  buildPythonPackage,
  django,
  fetchFromGitHub,
  lib,
  hatchling,
}:
buildPythonPackage (finalAttrs: {
  pname = "django-dbbackup";
  version = "5.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Archmonger";
    repo = "django-dbbackup";
    tag = finalAttrs.version;
    hash = "sha256-vSBZmYMcrpJQEhVVqKgn35vaI5TvMBbdwGXZOFjXQbw=";
  };

  build-system = [ hatchling ];

  dependencies = [
    django
  ];

  meta = {
    description = "Management commands to help backup and restore your project database and media files";
    homepage = "https://github.com/Archmonger/django-dbbackup";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})

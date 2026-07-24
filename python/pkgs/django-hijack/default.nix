{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  nix-update-script,

  # build-system
  flit-gettext,
  flit-scm,

  # dependencies
  django,

  # tests
  pytest-cov-stub,
  pytest-django,
}:

buildPythonPackage rec {
  pname = "django-hijack";
  version = "3.7.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "django-hijack";
    repo = "django-hijack";
    tag = version;
    hash = "sha256-91ziHv39GmXrbswqOyVHmSv11LqKNT318/8mx5iIdHg=";
  };

  build-system = [
    flit-gettext
    flit-scm
  ];

  dependencies = [ django ];
  # needed for npmDeps update
  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Allows superusers to hijack (=login as) and work on behalf of another user";
    homepage = "https://github.com/django-hijack/django-hijack";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  pythonOlder,
  replaceVars,

  # build-system
  setuptools,

  # dependencies
  asgiref,
  sqlparse,

  # optional-dependencies
  argon2-cffi,
  bcrypt,

  tzdata,
}:

buildPythonPackage (finalAttrs: {
  pname = "django";
  version = "6.0.6";
  pyproject = true;

  disabled = pythonOlder "3.12";

  src = fetchFromGitHub {
    owner = "django";
    repo = "django";
    tag = finalAttrs.version;
    hash = "sha256-hLnTqY64PfaGJ1JJccrxYms41Jp4E4pVq6rmrtFpESE=";
  };

  patches = [
    (replaceVars ./6.x/zoneinfo.patch {
      zoneinfo = tzdata + "/share/zoneinfo";
    })
    ./6.x/pythonpath.patch
    ./6.x/disable-failing-test.patch
    ./6.x/invalidate-importlib-cache.patch
  ];

  build-system = [ setuptools ];

  dependencies = [
    asgiref
    sqlparse
  ];

  optional-dependencies = {
    argon2 = [ argon2-cffi ];
    bcrypt = [ bcrypt ];
  };

  pythonImportsCheck = [ "django" ];

  meta = {
    description = "High-level Python Web framework that encourages rapid development and clean, pragmatic design";
    homepage = "https://www.djangoproject.com";
    license = lib.licenses.bsd3;
  };
})

{
  lib,
  buildPythonPackage,
  django,
  fetchFromGitHub,
  uv-build,
  oracledb,
  pytest-mypy-plugins,
  pytest-xdist,
  redis,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "django-stubs-ext";
  version = "5.2.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "typeddjango";
    repo = "django-stubs";
    tag = version;
    hash = "sha256-42FluS2fmfgj4qk2u+Z/7TGhXY4WKUc0cI00go6rnGc=";
  };

  postPatch = ''
    cd ext
    ln -s ../scripts

    substituteInPlace pyproject.toml \
      --replace-fail "uv_build>=0.9.9,<0.10.0" uv_build
  '';

  build-system = [ uv-build ];

  dependencies = [
    django
    typing-extensions
  ];

  optional-dependencies = {
    redis = [ redis ];
    oracle = [ oracledb ];
  };
  # Tests are not shipped with PyPI

  pythonImportsCheck = [ "django_stubs_ext" ];

  meta = {
    description = "Extensions and monkey-patching for django-stubs";
    homepage = "https://github.com/typeddjango/django-stubs";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

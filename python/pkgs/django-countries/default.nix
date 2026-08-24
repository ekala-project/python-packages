{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  uv-build,
  # dependencies
  asgiref,
  typing-extensions,
  # tests
  django,
}:

buildPythonPackage rec {
  pname = "django-countries";
  version = "9.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "SmileyChris";
    repo = "django-countries";
    tag = "v${version}";
    hash = "sha256-Lq2wXnC/0sT96AA0eW1TsrIm6qencXE4/3bHSni9nlQ=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "uv_build>=0.9.6,<0.10.0" uv_build
  '';

  build-system = [ uv-build ];

  dependencies = [
    asgiref
    typing-extensions
  ];

  meta = {
    description = "Provides a country field for Django models";
    homepage = "https://github.com/SmileyChris/django-countries";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

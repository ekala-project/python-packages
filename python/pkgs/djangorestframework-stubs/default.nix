{
  lib,
  buildPythonPackage,
  django-stubs,
  fetchFromGitHub,
  mypy,
  py,
  coreapi,
  pytest-mypy-plugins,
  requests,
  types-pyyaml,
  uv-build,
  types-markdown,
  types-requests,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "djangorestframework-stubs";
  version = "3.16.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "typeddjango";
    repo = "djangorestframework-stubs";
    tag = version;
    hash = "sha256-I7+XMUB87+bIyQMQZUm5hUTsJ+2wA3F6qyjJQeWeQdo=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "uv_build>=0.8.19,<0.10.0" "uv_build"
  '';

  build-system = [ uv-build ];

  dependencies = [
    django-stubs
    requests
    types-pyyaml
    types-requests
    typing-extensions
  ];

  optional-dependencies = {
    compatible-mypy = [ mypy ] ++ django-stubs.optional-dependencies.compatible-mypy;
    coreapi = [ coreapi ];
    markdown = [ types-markdown ];
  };
  meta = {
    description = "PEP-484 stubs for Django REST Framework";
    homepage = "https://github.com/typeddjango/djangorestframework-stubs";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

{
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  hatchling,
  httpx,
  pydantic,
  yarl,
  deprecation,
}:

buildPythonPackage (finalAttrs: {
  pname = "storage3";
  version = "2.31.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "supabase";
    repo = "supabase-py";
    tag = "v${finalAttrs.version}";
    hash = "sha256-cdsxB42X9nJeDElOI20jaWRKOrpNYwY2sB4vty8yYUM=";
  };

  sourceRoot = "${finalAttrs.src.name}/src/storage";

  build-system = [ hatchling ];

  dependencies = [
    httpx
    pydantic
    yarl
    deprecation
  ]
  ++ httpx.optional-dependencies.http2;

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'requires = ["uv_build>=0.8.3,<0.9.0"]' 'requires = ["hatchling"]' \
      --replace-fail 'build-backend = "uv_build"' 'build-backend = "hatchling.build"'
  '';
  pythonImportsCheck = [ "storage3" ];
  meta = {
    description = "Client library for Supabase Functions";
    homepage = "https://github.com/supabase/supabase-py";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})

{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  httpx,
  pydantic,
  pyjwt,
  faker,
  respx,
  pytest-mock,
  pytest-asyncio,
}:
buildPythonPackage (finalAttrs: {
  pname = "supabase-auth";
  version = "2.31.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "supabase";
    repo = "supabase-py";
    tag = "v${finalAttrs.version}";
    hash = "sha256-cdsxB42X9nJeDElOI20jaWRKOrpNYwY2sB4vty8yYUM=";
  };

  sourceRoot = "${finalAttrs.src.name}/src/auth";

  build-system = [ hatchling ];

  dependencies = [
    httpx
    pydantic
    pyjwt
  ]
  ++ httpx.optional-dependencies.http2
  ++ pyjwt.optional-dependencies.crypto;

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'requires = ["uv_build>=0.8.3,<0.9.0"]' 'requires = ["hatchling"]' \
      --replace-fail 'build-backend = "uv_build"' 'build-backend = "hatchling.build"'
  '';
  pythonImportsCheck = [ "supabase_auth" ];

  meta = {
    description = "Client library for Supabase Auth";
    homepage = "https://github.com/supabase/supabase-py/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})

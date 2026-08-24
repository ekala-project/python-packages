{ lib
, fetchPypi
, buildPythonPackage
, postgresql
, uv-build
,
}:

buildPythonPackage (finalAttrs: {
  pname = "pgsanity";
  version = "0.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-Po/DPQpk54w1gWOL9aArN6I8dmMb7uRYxuRMI6MIDKU=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "uv_build>=0.8.19,<0.9.0" uv_build
  '';

  build-system = [
    uv-build
  ];

  unittestFlagsArray = [ "test" ];

  propagatedBuildInputs = [ postgresql ];

  # To find "ecpg"
  nativeBuildInputs = [ (lib.getDev postgresql) ];

  meta = {
    homepage = "https://github.com/markdrago/pgsanity";
    description = "Checks the syntax of Postgresql SQL files";
    mainProgram = "pgsanity";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})

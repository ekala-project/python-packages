{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  regex,
}:

buildPythonPackage (finalAttrs: {
  pname = "rebulk";
  version = "6.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-kdeSSDaQrrJJu1azNXWY3WWPD1MwZmgNuMPhtvfciSk=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'requires = ["uv_build>=0.11,<0.12"]' 'requires = ["setuptools"]' \
      --replace-fail 'build-backend = "uv_build"' 'build-backend = "setuptools.build_meta"'
  '';

  build-system = [ setuptools ];

  dependencies = [ regex ];

  pythonImportsCheck = [ "rebulk" ];

  meta = {
    description = "Advanced string matching from simple patterns";
    homepage = "https://github.com/Toilal/rebulk/";
    license = lib.licenses.mit;
  };
})

{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  regex,
}:

buildPythonPackage rec {
  pname = "rebulk";
  version = "6.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-1t8MjIluFgCHxpgfN3DtUT7Jc6n0BmueSwYU6wi6DOE=";
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
}

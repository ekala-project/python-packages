{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  pytest,
}:

buildPythonPackage rec {
  pname = "pytest-reraise";
  version = "2.1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "bjoluc";
    repo = "pytest-reraise";
    tag = "v${version}";
    hash = "sha256-mgNKoZ+2sinArTZhSwhLxzBTb4QfiT1LWBs7w5MHXWA=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'poetry>=0.12' 'poetry-core>=1.0.0' \
      --replace-fail 'poetry.masonry' 'poetry.core.masonry'
  '';

  build-system = [ poetry-core ];

  dependencies = [ pytest ];

  doCheck = false;

  pythonImportsCheck = [ "pytest_reraise" ];

  meta = {
    description = "Make multi-threaded pytest test cases fail when they should";
    homepage = "https://github.com/bjoluc/pytest-reraise";
    license = lib.licenses.mit;
  };
}

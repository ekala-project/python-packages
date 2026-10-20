{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  poetry-core,
  pyserial,
}:

buildPythonPackage (finalAttrs: {
  pname = "aioserial";
  version = "1.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-cCvwOw64S47y2NrFy5JeHmhdzpj3exJVabxv0rO1gig=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "poetry.masonry.api" "poetry.core.masonry.api" \
      --replace-fail 'requires = ["poetry>=0.12"]' 'requires = ["poetry-core"]'
  '';

  build-system = [ poetry-core ];

  dependencies = [ pyserial ];

  # Project has no tests

  pythonImportsCheck = [ "aioserial" ];

  meta = {
    description = "Python module for async serial communication";
    homepage = "https://github.com/changyuheng/aioserial";
    license = lib.licenses.mpl20;
  };
})

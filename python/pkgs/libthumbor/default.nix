{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  poetry-core,
  django,
  six,
  pycrypto,
}:

buildPythonPackage (finalAttrs: {
  pname = "libthumbor";
  version = "2.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-1PsiFZrTDVQqy8A3nkaM5LdPiBoriRgHkklTOiczN+g=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "poetry.masonry.api" "poetry.core.masonry.api" \
      --replace-fail 'requires = ["poetry>=0.12"]' 'requires = ["poetry-core"]'
  '';

  build-system = [ poetry-core ];

  buildInputs = [ django ];

  dependencies = [
    six
    pycrypto
  ];

  pythonImportsCheck = [ "libthumbor" ];

  meta = {
    description = "Python extension to thumbor";
    homepage = "https://github.com/heynemann/libthumbor";
    license = lib.licenses.mit;
  };
})

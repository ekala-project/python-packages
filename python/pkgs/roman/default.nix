{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "roman";
  version = "5.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-J1/p9GKQ99D/rqHDMlG5K45GOs4jZgUIzu9SLnWHy28=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"setuptools >= 78.1.1,< 81"' '"setuptools"'
  '';

  build-system = [ setuptools ];

  pythonImportsCheck = [ "roman" ];

  meta = {
    description = "Integer to Roman numerals converter";
    homepage = "https://pypi.org/project/roman/";
    license = lib.licenses.psfl;
  };
})

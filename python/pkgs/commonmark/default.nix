{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "commonmark";
  version = "0.9.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-GU1pPgwaxJ6DwmRVve6ySDI15igDE8WLEdC3HBn1jtE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "commonmark" ];

  meta = {
    description = "Python CommonMark parser";
    homepage = "https://github.com/readthedocs/commonmark.py";
    license = lib.licenses.bsd3;
  };
})

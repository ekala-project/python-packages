{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "schedule";
  version = "1.2.2";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-Ff6cdf5f2blifz8ZzA7xQgUI+fmkb0XNB2nvde3l8Lc=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "schedule" ];

  meta = {
    description = "Python job scheduling for humans";
    homepage = "https://github.com/dbader/schedule";
    license = lib.licenses.mit;
  };
})

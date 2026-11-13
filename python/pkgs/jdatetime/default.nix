{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  jalali-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "jdatetime";
  version = "6.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-KRF4HsZBolMOnFfhBjoa2PLiDsf+7Jy86/arnbXvpHo=";
  };

  build-system = [ setuptools ];

  dependencies = [ jalali-core ];

  pythonImportsCheck = [ "jdatetime" ];

  meta = {
    description = "Jalali datetime binding";
    homepage = "https://github.com/slashmili/python-jalali";
    license = lib.licenses.psfl;
  };
})

{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "Unidecode";
  version = "1.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-zjWYUAgzi2dlcwI6zDgtYsJk8wfI95Y3M0Ba3TfqKyM=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "unidecode" ];

  meta = {
    description = "ASCII transliterations of Unicode text";
    homepage = "https://github.com/avian2/unidecode";
    license = lib.licenses.gpl2Plus;
  };
})

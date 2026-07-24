{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "asdf-standard";
  version = "1.5.0";
  pyproject = true;

  src = fetchPypi {
    pname = "asdf_standard";
    inherit version;
    hash = "sha256-WULK99FD859y9jRIQ3PH9AzkhXHR2zwnHhOFjjP+WWY=";
  };

  build-system = [ setuptools-scm ];

  pythonImportsCheck = [ "asdf_standard" ];

  meta = {
    description = "Standards document describing ASDF";
    homepage = "https://github.com/asdf-format/asdf-standard";
    license = lib.licenses.bsd3;
  };
}

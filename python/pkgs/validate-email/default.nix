{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "validate_email";
  version = "1.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-eEcZ3F94C+MZzdGF3IXdk6/r2267lDgRvEx8X5xyrq8=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "validate_email" ];

  meta = {
    description = "Verify if an email address is valid and really exists";
    homepage = "https://github.com/syrusakbary/validate_email";
    license = lib.licenses.lgpl3Plus;
  };
}

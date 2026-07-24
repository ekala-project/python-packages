{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "ukpostcodeparser";
  version = "1.1.2";
  pyproject = true;

  src = fetchPypi {
    pname = "UkPostcodeParser";
    inherit version;
    hash = "sha256-kwJk76KT24CvAQOk/pwWGwY2VZjSS7b+VAPz9XxwUw4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "ukpostcodeparser" ];

  meta = {
    description = "UK Postcode parser";
    homepage = "https://github.com/hamstah/ukpostcodeparser";
    license = lib.licenses.publicDomain;
  };
}

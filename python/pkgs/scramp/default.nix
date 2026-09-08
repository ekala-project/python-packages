{
  lib,
  asn1crypto,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  versioningit,
}:

buildPythonPackage rec {
  pname = "scramp";
  version = "1.4.17";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-KJcPKevDPfR/mXXIBeXlo2Dv/lsxBF5gfWSztgNw26E=";
  };

  build-system = [
    hatchling
    versioningit
  ];

  dependencies = [ asn1crypto ];

  pythonImportsCheck = [ "scramp" ];

  meta = {
    description = "Implementation of the SCRAM authentication protocol";
    homepage = "https://codeberg.org/tlocke/scramp";
    license = lib.licenses.mit;
  };
}

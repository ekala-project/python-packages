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
  version = "1.4.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-vj++d0yld6emWBF9ygFOXSVNFYzsrj3WAzLf4zzm144=";
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

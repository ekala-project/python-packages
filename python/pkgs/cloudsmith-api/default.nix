{
  lib,
  buildPythonPackage,
  certifi,
  fetchPypi,
  python-dateutil,
  six,
  urllib3,
}:

buildPythonPackage (finalAttrs: {
  pname = "cloudsmith-api";
  version = "2.0.43";
  format = "wheel";

  src = fetchPypi {
    dist = "py3";
    python = "py3";
    pname = "cloudsmith_api";
    inherit (finalAttrs) version;
    format = "wheel";
    hash = "sha256-DGMJ3mfVvtMEzsOAr00/yDAp3uMSVksC1e96RIVBOtA=";
  };

  dependencies = [
    certifi
    python-dateutil
    six
    urllib3
  ];

  # Wheels have no tests

  pythonImportsCheck = [ "cloudsmith_api" ];

  meta = {
    description = "Cloudsmith API Client";
    homepage = "https://github.com/cloudsmith-io/cloudsmith-api";
    license = lib.licenses.asl20;
  };
})

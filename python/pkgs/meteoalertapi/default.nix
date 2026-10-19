{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  requests,
  xmltodict,
}:

buildPythonPackage (finalAttrs: {
  pname = "meteoalertapi";
  version = "0.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "rolfberkenbosch";
    repo = "meteoalert-api";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Imb4DVcNB3QiVSCLCI+eKpfl73aMn4NIItQVf7p0H+E=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    xmltodict
  ];

  # Tests require network access

  pythonImportsCheck = [ "meteoalertapi" ];

  meta = {
    description = "Python wrapper for MeteoAlarm.org";
    homepage = "https://github.com/rolfberkenbosch/meteoalert-api";
    license = lib.licenses.mit;
  };
})

{
  lib,
  buildPythonPackage,
  fetchPypi,
  distro,
  httplib2,
  oauthlib,
  setuptools,
  six,
  wadllib,
}:

buildPythonPackage (finalAttrs: {
  pname = "lazr-restfulclient";
  version = "4.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "lazr_restfulclient";
    inherit (finalAttrs) version;
    hash = "sha256-EtSa/UgSP1CZWPJvdXEhuzdUjLKx3FhfVHuuLOc/RcE=";
  };

  build-system = [ setuptools ];

  dependencies = [
    distro
    httplib2
    oauthlib
    setuptools
    six
    wadllib
  ];

  # E   ModuleNotFoundError: No module named 'lazr.uri'
  pythonImportsCheck = [ "lazr.restfulclient" ];

  pythonNamespaces = [ "lazr" ];

  meta = {
    description = "Programmable client library that takes advantage of the commonalities among";
    homepage = "https://pypi.org/project/lazr.restfulclient";
    license = lib.licenses.lgpl3Plus;
  };
})

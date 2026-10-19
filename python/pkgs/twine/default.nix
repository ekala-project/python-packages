{
  lib,
  buildPythonPackage,
  fetchPypi,
  id,
  keyring,
  packaging,
  pkginfo,
  readme-renderer,
  requests,
  requests-toolbelt,
  rich,
  rfc3986,
  setuptools,
  setuptools-scm,
  urllib3,
}:

buildPythonPackage (finalAttrs: {
  pname = "twine";
  version = "7.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-hc2ynFGO/vhnNgrkrNSw39YchlSiL8oI5vhTnwUCIXc=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    id
    keyring
    packaging
    pkginfo
    readme-renderer
    requests
    requests-toolbelt
    rfc3986
    rich
    urllib3
  ];

  pythonImportsCheck = [ "twine" ];

  meta = {
    description = "Collection of utilities for interacting with PyPI";
    homepage = "https://github.com/pypa/twine";
    license = lib.licenses.asl20;
  };
})

{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "kitchen";
  version = "1.2.6";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-uEz1gvG9FVa2DrxzcLnTMeuSR7awcM6J3+lZy6LAsDw=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "kitchen" ];

  meta = {
    description = "Kitchen contains a cornucopia of useful code";
    homepage = "https://github.com/fedora-infra/kitchen";
    license = lib.licenses.lgpl2Only;
  };
})

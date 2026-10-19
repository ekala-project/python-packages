{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "configupdater";
  version = "3.2";
  pyproject = true;

  src = fetchPypi {
    pname = "ConfigUpdater";
    inherit (finalAttrs) version;
    hash = "sha256-n9rFODHBsGKSm/OYtkm4fKMOfxpzXz+/SCBygEEGMGs=";
  };

  build-system = [ setuptools-scm ];

  pythonImportsCheck = [ "configupdater" ];

  meta = {
    description = "Parser like ConfigParser but for updating configuration files";
    homepage = "https://configupdater.readthedocs.io/en/latest/";
    license = with lib.licenses; [
      mit
      psfl
    ];
  };
})

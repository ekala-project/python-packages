{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  requests,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "docloud";
  version = "1.0.375";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "996d55407498fd01e6c6c480f367048f92255e9ca9db0e9ea19aaef91328a441";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    six
  ];

  # Pypi's tarball doesn't contain tests. Source not available.
  pythonImportsCheck = [ "docloud" ];

  meta = {
    description = "IBM Decision Optimization on Cloud Python client";
    homepage = "https://onboarding-oaas.docloud.ibmcloud.com/software/analytics/docloud/";
    license = lib.licenses.asl20;
  };
})

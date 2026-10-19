{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  pytestCheckHook,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "opencontainers";
  version = "0.0.15";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-o6QBJMxo7aVse0xauSTxi1UEW4RYrKlhH1v6g/fvrv4=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    sed -i "/pytest-runner/d" setup.py
  '';

  optional-dependencies.reggie = [ requests ];

  pythonImportsCheck = [ "opencontainers" ];

  nativeCheckInputs = [ pytestCheckHook ] ++ optional-dependencies.reggie;

  __darwinAllowLocalNetworking = true;

  meta = {
    description = "Python module for oci specifications";
    homepage = "https://github.com/vsoch/oci-python";
    license = lib.licenses.mpl20;
  };
})

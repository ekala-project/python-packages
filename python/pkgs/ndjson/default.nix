{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  pytestCheckHook,
  six,
  watchdog,
}:

buildPythonPackage (finalAttrs: {
  pname = "ndjson";
  version = "0.3.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-v5dGy2uxy1PRcs2n8VTAfHhtZl/yg0Hk5om3lrIp5dY=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace setup.py \
      --replace "'pytest-runner', " ""
  '';

  nativeCheckInputs = [
    pytestCheckHook
    six
    watchdog
  ];

  pythonImportsCheck = [ "ndjson" ];

  meta = {
    description = "Module supports ndjson";
    homepage = "https://github.com/rhgrant10/ndjson";
    license = lib.licenses.gpl3Only;
  };
})

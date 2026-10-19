{
  lib,
  aiohttp,
  async-timeout,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytest-aiohttp,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "moonraker-api";
  version = "4.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "cmroche";
    repo = "moonraker-api";
    tag = "v${finalAttrs.version}";
    hash = "sha256-I+/c3dVVuNGKWztVsEKi2AErACbhQoU8ZE3ye9B2HxM=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    # see comment on https://github.com/cmroche/moonraker-api/commit/e5ca8ab60d2839e150a81182fbe65255d84b4e4e
    substituteInPlace setup.py \
      --replace 'name="moonraker-api",' 'name="moonraker-api",version="${finalAttrs.version}",'
  '';

  dependencies = [
    aiohttp
    async-timeout
  ];

  nativeCheckInputs = [
    pytest-aiohttp
    pytestCheckHook
  ];

  pythonImportsCheck = [ "moonraker_api" ];

  meta = {
    description = "Python API for the Moonraker API";
    homepage = "https://github.com/cmroche/moonraker-api";
    license = lib.licenses.gpl3Only;
  };
})

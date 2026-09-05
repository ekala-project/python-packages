{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  # dependencies
  aiohttp,
  defusedxml,
  python-didl-lite,
  voluptuous,
}:

buildPythonPackage rec {
  pname = "async-upnp-client";
  version = "0.48.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "StevenLooman";
    repo = "async_upnp_client";
    tag = version;
    hash = "sha256-bORaKv0ntXubjGuVNKVRaWeKgqvmN5HEmTYqva8yobQ=";
  };

  build-system = [ setuptools ];

  dependencies = [
    aiohttp
    defusedxml
    python-didl-lite
    voluptuous
  ];

  pythonImportsCheck = [ "async_upnp_client" ];

  meta = {
    description = "Asyncio UPnP Client library for Python";
    homepage = "https://github.com/StevenLooman/async_upnp_client";
    license = lib.licenses.asl20;
    maintainers = [ ];
    mainProgram = "upnp-client";
  };
}

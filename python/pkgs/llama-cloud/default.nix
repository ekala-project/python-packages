{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  hatch-fancy-pypi-readme,
  pythonOlder,
  pythonAtLeast,

  # Dependencies
  httpx,
  pydantic,
  anyio,
  distro,
  sniffio,

  # Test dependencies
  pytest-asyncio,
  pytest-xdist,
  dirty-equals,
  respx,
  llama-index-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "llama-cloud";
  version = "2.11.0";
  pyproject = true;

  src = fetchPypi {
    pname = "llama_cloud";
    inherit (finalAttrs) version;
    hash = "sha256-vvyYS5vxN2cMEIEAy82qd1PCxh/TYcDOL6YivkjN9c0=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "hatchling==1.26.3" "hatchling>=1.26.3"
  '';

  build-system = [
    hatchling
    hatch-fancy-pypi-readme
  ];

  dependencies = [
    httpx
    pydantic
    distro
    sniffio
    anyio
  ];
  meta = {
    description = "LlamaIndex Python Client";
    homepage = "https://pypi.org/project/llama-cloud/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})

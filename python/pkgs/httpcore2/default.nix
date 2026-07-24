{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,
  hatch-fancy-pypi-readme,
  uv-dynamic-versioning,

  # dependencies
  h11,
  truststore,

  # optional dependencies
  h2,
  socksio,
  trio,
  anyio,

  # tests
  pytest-httpbin,
  pytest-trio,

  # reverse deps
  httpx2,
}:

buildPythonPackage (finalAttrs: {
  pname = "httpcore2";
  version = "2.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pydantic";
    repo = "httpx2";
    tag = "v${finalAttrs.version}";
    hash = "sha256-vIWAUjHPyafbeeUc2OvGpkiOoTj1fTniRnQiKSdkm6s=";
  };

  postPatch = ''
    pushd src/httpcore2
  '';

  build-system = [
    hatchling
    hatch-fancy-pypi-readme
    uv-dynamic-versioning
  ];

  dependencies = [
    h11
    truststore
  ];

  optional-dependencies = {
    asyncio = [ anyio ];
    http2 = [ h2 ];
    socks = [ socksio ];
    trio = [ trio ];
  };

  pythonImportsCheck = [
    "httpcore2"
  ];
  __structuredAttrs = true;

  meta = {
    description = "A next generation HTTP client for Python";
    homepage = "https://github.com/pydantic/httpx2";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})

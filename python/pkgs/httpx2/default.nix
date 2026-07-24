{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  isPyPy,
  pythonOlder,

  # build-system
  hatchling,
  hatch-fancy-pypi-readme,
  uv-dynamic-versioning,

  # dependencies
  anyio,
  certifi,
  httpcore2,
  idna,

  # optional dependencies
  brotli,
  brotlicffi,
  click,
  h2,
  pygments,
  rich,
  socksio,
  zstandard,

  # tests
  chardet,
  pytest-trio,
  trustme,
  uvicorn,

  # reverse deps
  httpx2,
}:

buildPythonPackage (finalAttrs: {
  pname = "httpx2";
  version = "2.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pydantic";
    repo = "httpx2";
    tag = "v${finalAttrs.version}";
    hash = "sha256-vIWAUjHPyafbeeUc2OvGpkiOoTj1fTniRnQiKSdkm6s=";
  };

  postPatch = ''
    pushd src/httpx2
  '';

  build-system = [
    hatchling
    hatch-fancy-pypi-readme
    uv-dynamic-versioning
  ];

  dependencies = [
    anyio
    certifi
    httpcore2
    idna
  ];

  optional-dependencies = {
    brotli = if isPyPy then [ brotlicffi ] else [ brotli ];
    cli = [
      click
      pygments
      rich
    ];
    http2 = [ h2 ];
    socks = [ socksio ];
    zstd = lib.optionals (pythonOlder "3.14") [ zstandard ];
  };

  pythonImportsCheck = [
    "httpx2"
  ];
  __structuredAttrs = true;

  meta = {
    description = "A next generation HTTP client for Python";
    homepage = "https://github.com/pydantic/httpx2";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})

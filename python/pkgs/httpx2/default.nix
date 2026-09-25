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
  version = "2.12.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pydantic";
    repo = "httpx2";
    tag = "v${finalAttrs.version}";
    hash = "sha256-mEJHlG6skKkV90SfjTg+MHGkL7gnf3QLKLbWlTtEb9Q=";
  };

  postPatch = ''
    substituteInPlace src/httpx2/pyproject.toml \
      --replace-fail "uv-dynamic-versioning>=0.14.0" "uv-dynamic-versioning>=0.13.0"
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
  };
})

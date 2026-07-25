{
  lib,
  stdenv,
  anyio,
  brotli,
  brotlicffi,
  buildPythonPackage,
  certifi,
  click,
  fetchFromGitHub,
  h2,
  hatch-fancy-pypi-readme,
  hatchling,
  httpcore,
  idna,
  isPyPy,
  pygments,
  python,
  rich,
  socksio,
  trustme,
  zstandard,
}:

buildPythonPackage rec {
  pname = "httpx";
  version = "0.28.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "encode";
    repo = "httpx";
    tag = version;
    hash = "sha256-tB8uZm0kPRnmeOvsDdrkrHcMVIYfGanB4l/xHsTKpgE=";
  };

  build-system = [
    hatch-fancy-pypi-readme
    hatchling
  ];

  dependencies = [
    anyio
    certifi
    httpcore
    idna
  ];

  optional-dependencies = {
    brotli = if isPyPy then [ brotlicffi ] else [ brotli ];
    cli = [
      click
      rich
      pygments
    ];
    http2 = [ h2 ];
    socks = [ socksio ];
    zstd = [ zstandard ];
  };

  # trustme uses pyopenssl
  doCheck = !(stdenv.hostPlatform.isDarwin && stdenv.hostPlatform.isAarch64);
  pythonImportsCheck = [ "httpx" ];
  # stdenv's fake SSL_CERT_FILE breaks default http transport constructor with:
  # FileNotFoundError: [Errno 2] No such file or directory
  setupHook = ./setup-hook.sh;

  meta = {
    description = "Next generation HTTP client";
    mainProgram = "httpx";
    homepage = "https://github.com/encode/httpx";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}

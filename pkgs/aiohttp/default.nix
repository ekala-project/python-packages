{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  isPyPy,
  pythonOlder,

  # build-system
  cython,
  pkg-config,
  pkgconfig,
  setuptools,

  # native dependencies
  llhttp,

  # dependencies
  aiohappyeyeballs,
  aiosignal,
  async-timeout,
  attrs,
  backports-zstd,
  frozenlist,
  multidict,
  propcache,
  yarl,

  # optional dependencies
  aiodns,
  brotli,
  brotlicffi,
}:

buildPythonPackage (finalAttrs: {
  pname = "aiohttp";
  version = "3.13.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "aio-libs";
    repo = "aiohttp";
    tag = "v${finalAttrs.version}";
    hash = "sha256-LqYGrrWgSZazk0hjQvTFwqtU/PtMEaPi+m1Ya8Ds+pU=";
  };

  postPatch = ''
    rm -r vendor
    patchShebangs tools
    touch .git

    substituteInPlace Makefile \
      --replace-fail "cythonize: .install-cython" "cythonize:"
  '';

  build-system = [
    cython
    pkgconfig
    setuptools
  ];

  nativeBuildInputs = [ pkg-config ];

  preBuild = ''
    make cythonize
  '';

  buildInputs = [
    llhttp
  ];

  env.AIOHTTP_USE_SYSTEM_DEPS = true;

  dependencies =
    [
      aiohappyeyeballs
      aiosignal
      attrs
      frozenlist
      multidict
      propcache
      yarl
    ]
    ++ lib.optionals (pythonOlder "3.11") [
      async-timeout
    ]
    ++ finalAttrs.optional-dependencies.speedups;

  optional-dependencies.speedups = [
    aiodns
    backports-zstd
    (if isPyPy then brotlicffi else brotli)
  ];

  pythonImportsCheck = [ "aiohttp" ];

  __darwinAllowLocalNetworking = true;

  meta = {
    description = "Asynchronous HTTP Client/Server for Python and asyncio";
    license = lib.licenses.asl20;
    homepage = "https://github.com/aio-libs/aiohttp";
  };
})

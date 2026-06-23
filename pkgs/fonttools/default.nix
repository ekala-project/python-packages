{
  lib,
  stdenv,
  buildPythonPackage,
  pythonOlder,
  isPyPy,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  lxml,
  brotli,
  brotlicffi,
  zopfli,
  unicodedata2,
  lz4,
  scipy,
  munkres,
  pycairo,
  matplotlib,
  sympy,
  xattr,
  skia-pathops,
  uharfbuzz,
}:

buildPythonPackage rec {
  pname = "fonttools";
  version = "4.61.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fonttools";
    repo = "fonttools";
    tag = version;
    hash = "sha256-762bqAhOqqnuNSH8yFLTBnzYuigs716nt+uC1UwUqT4=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  optional-dependencies =
    let
      extras = {
        ufo = [ ];
        lxml = [ lxml ];
        woff = [
          (if isPyPy then brotlicffi else brotli)
          zopfli
        ];
        unicode = lib.optional (pythonOlder "3.13") unicodedata2;
        graphite = [ lz4 ];
        interpolatable = [
          pycairo
          (if isPyPy then munkres else scipy)
        ];
        plot = [ matplotlib ];
        symfont = [ sympy ];
        type1 = lib.optional stdenv.hostPlatform.isDarwin xattr;
        pathops = lib.optional (lib.meta.availableOn stdenv.hostPlatform skia-pathops) skia-pathops;
        repacker = [ uharfbuzz ];
      };
    in
    extras // { all = lib.concatLists (lib.attrValues extras); };

  pythonImportsCheck = [ "fontTools" ];

  meta = {
    homepage = "https://github.com/fonttools/fonttools";
    description = "Library to manipulate font files from Python";
    license = lib.licenses.mit;
  };
}

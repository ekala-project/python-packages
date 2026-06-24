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
  lz4,
  scipy,
  matplotlib,
  sympy,
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
        ];
        unicode = [ ];
        graphite = [ lz4 ];
        interpolatable = [
          scipy
        ];
        plot = [ matplotlib ];
        symfont = [ sympy ];
        type1 = [ ];
        pathops = [ ];
        repacker = [ ];
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

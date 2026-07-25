{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  six,
  stdenv,
}:

buildPythonPackage rec {
  pname = "more-itertools";
  version = "11.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "more-itertools";
    repo = "more-itertools";
    tag = "v${version}";
    hash = "sha256-fk2QRwOYgYfANtwRpEtGK5F+rRI2Gj25l0XaP9svJz8=";
  };

  build-system = [ flit-core ];

  propagatedBuildInputs = [ six ];
  # iterable = range(10 ** 10)  # Is efficiently reversible
  # OverflowError: Python int too large to convert to C long
  doCheck = !stdenv.hostPlatform.is32bit;

  meta = {
    homepage = "https://more-itertools.readthedocs.org";
    description = "Expansion of the itertools module";
    downloadPage = "https://github.com/more-itertools/more-itertools";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

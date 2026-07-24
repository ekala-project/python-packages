{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  sphinx,
  stdenv,
  unstableGitUpdater,
}:

buildPythonPackage rec {
  pname = "curio";
  version = "1.6-unstable-2024-04-11";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dabeaz";
    repo = "curio";
    rev = "148454621f9bd8dd843f591e87715415431f6979";
    hash = "sha256-WLu7XF5wiVzBRQH1KRdAbhluTvGE7VvnRQUS0c3SUDk=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "curio" ];

  # curio does not package new releaseas any more
  passthru.updateScript = unstableGitUpdater { };

  meta = {
    description = "Library for performing concurrent I/O with coroutines in Python";
    homepage = "https://github.com/dabeaz/curio";
    license = lib.licenses.bsd3;
    maintainers = [ lib.maintainers.pbsds ];
  };
}

{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  python,

  # build-system
  cython,
  setuptools,

  # optional
  numpy,

  # tests
  hypothesis,
  pytest-cov-stub,
  sympy,
}:

buildPythonPackage rec {
  pname = "ndindex";
  version = "1.10.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Quansight-Labs";
    repo = "ndindex";
    tag = version;
    hash = "sha256-rjhCysdhLCAofob7yUL7s65hMju13uotrzJ+aY0stzI=";
  };

  build-system = [
    cython
    setuptools
  ];

  postPatch = ''
    substituteInPlace pytest.ini \
      --replace-fail "--flakes" ""
  '';

  optional-dependencies.arrays = [ numpy ];

  pythonImportsCheck = [ "ndindex" ];

  # fix Hypothesis timeouts
  meta = {
    description = "Python library for manipulating indices of ndarrays";
    homepage = "https://github.com/Quansight-Labs/ndindex";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

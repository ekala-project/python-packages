{
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  numpy,
  pytest-repeat,
  setuptools,
  tabulate,
}:

buildPythonPackage rec {
  pname = "simsimd";
  version = "7.8.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ashvardanian";
    repo = "SimSIMD";
    tag = "v${version}";
    hash = "sha256-Wn1qpPKdbWUJ5Gy4hnX9XcEneFvgrijGuI+v1F9+9EE=";
  };

  build-system = [
    setuptools
  ];

  pythonImportsCheck = [
    "numkong"
  ];
  meta = {
    description = "Portable mixed-precision BLAS-like vector math library for x86 and ARM";
    homepage = "https://github.com/ashvardanian/SimSIMD";
    license = with lib.licenses; [
      asl20
      # or
      bsd3
    ];
    maintainers = [ ];
  };
}

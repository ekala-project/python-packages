{
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  numpy,
  pytest-repeat,
  setuptools,
}:

buildPythonPackage rec {
  pname = "stringzilla";
  version = "5.1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ashvardanian";
    repo = "stringzilla";
    tag = "v${version}";
    hash = "sha256-RENsISsEfDJaoQK9v9i6vM3OId7FREw5hixpEUETfEw=";
  };

  build-system = [
    setuptools
  ];

  pythonImportsCheck = [ "stringzilla" ];
  meta = {
    description = "SIMD-accelerated string search, sort, hashes, fingerprints, & edit distances";
    homepage = "https://github.com/ashvardanian/stringzilla";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}

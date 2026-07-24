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
  version = "4.6.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ashvardanian";
    repo = "stringzilla";
    tag = "v${version}";
    hash = "sha256-PAs5j+J3BH23Yk2K0tYvCmz7cTU4djePzUpjsCk8YZs=";
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

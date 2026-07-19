{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "fuzzyfinder";
  version = "2.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "amjith";
    repo = "fuzzyfinder";
    tag = "v${version}";
    hash = "sha256-Zqh2H2d2TCxErmEE9gQwdpzZBGsjeQIo3AxBsc+C5u0=";
  };

  build-system = [ setuptools-scm ];

  pythonImportsCheck = [ "fuzzyfinder" ];

  meta = {
    description = "Fuzzy Finder implemented in Python";
    homepage = "https://github.com/amjith/fuzzyfinder";
    changelog = "https://github.com/amjith/fuzzyfinder/blob/${src.tag}/CHANGELOG.rst";
    license = lib.licenses.bsd3;
  };
}

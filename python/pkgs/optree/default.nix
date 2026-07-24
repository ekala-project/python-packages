{
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  cmake,
  setuptools,
  typing-extensions,
  pybind11,
}:

buildPythonPackage rec {
  pname = "optree";
  version = "0.18.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "metaopt";
    repo = "optree";
    tag = "v${version}";
    hash = "sha256-i/vn9Lo5UiY3+1Mh6FMSMjEyDcs8dtWSL3ESZ8CyHPw=";
  };

  dontUseCmakeConfigure = true;

  propagatedBuildInputs = [ typing-extensions ];
  nativeBuildInputs = [
    setuptools
    pybind11
    cmake
  ];
  # prevent import failures from pytest
  pythonImportsCheck = [ "optree" ];

  meta = {
    description = "Optimized PyTree Utilities";
    homepage = "https://github.com/metaopt/optree";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}

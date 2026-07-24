{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pcpp";
  version = "1.30";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ned14";
    repo = "pcpp";
    tag = "v${version}";
    hash = "sha256-Fs+CMV4eRKcB+KdV93ncgcqaMnO5etnMY/ivmSJh3Wc=";
    fetchSubmodules = true;
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pcpp" ];

  meta = {
    homepage = "https://github.com/ned14/pcpp";
    description = "C99 preprocessor written in pure Python";
    mainProgram = "pcpp";
    license = lib.licenses.bsd0;
  };
}

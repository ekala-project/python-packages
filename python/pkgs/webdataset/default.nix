{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  curl,

  # build-system
  setuptools,

  # dependencies
  braceexpand,
  numpy,
  pyyaml,
}:
buildPythonPackage {
  pname = "webdataset";
  version = "1.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "webdataset";
    repo = "webdataset";
    # recent versions are not tagged on GitHub
    rev = "0773837ecd298587fc89c4f944ef346ef1a6b619";
    hash = "sha256-jFFRp5W9yP1mKi9x43EdOakFAd9ArnDqH3dnvFOeCmc=";
  };

  postPatch = ''
    substituteInPlace src/webdataset/gopen.py \
      --replace-fail \
        '"curl"' \
        '"${lib.getExe curl}"'
  '';

  build-system = [
    setuptools
  ];

  dependencies = [
    braceexpand
    numpy
    pyyaml
  ];
  pythonImportsCheck = [ "webdataset" ];
  meta = {
    description = "High-performance Python-based I/O system for large (and small) deep learning problems, with strong support for PyTorch";
    mainProgram = "widsindex";
    homepage = "https://github.com/webdataset/webdataset";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}

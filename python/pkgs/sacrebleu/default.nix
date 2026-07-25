{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools-scm,

  # Propagated build inputs
  portalocker,
  regex,
  tabulate,
  numpy,
  colorama,
  lxml,
}:
let
  pname = "sacrebleu";
  version = "2.6.0";
in
buildPythonPackage {
  inherit pname version;
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mjpost";
    repo = "sacrebleu";
    tag = "v${version}";
    hash = "sha256-R/lN39c/O3QcG70mD5ahUB4rK6Bd/vOvZMiYzYgrOjQ=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [
    portalocker
    regex
    tabulate
    numpy
    colorama
    lxml
  ];
  pythonImportsCheck = [ "sacrebleu" ];

  meta = {
    description = "Hassle-free computation of shareable, comparable, and reproducible BLEU, chrF, and TER scores";
    mainProgram = "sacrebleu";
    homepage = "https://github.com/mjpost/sacrebleu";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}

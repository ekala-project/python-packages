{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  wcwidth,

  # tests
}:

buildPythonPackage (finalAttrs: {
  pname = "ftfy";
  version = "6.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "rspeer";
    repo = "python-ftfy";
    tag = "v${finalAttrs.version}";
    hash = "sha256-TmwDJeUDcF+uOB2X5tMmnf9liCI9rP6dYJVmJoaqszo=";
  };

  build-system = [ hatchling ];

  dependencies = [ wcwidth ];

  pythonImportsCheck = [ "ftfy" ];
  meta = {
    description = "Given Unicode text, make its representation consistent and possibly less broken";
    mainProgram = "ftfy";
    homepage = "https://github.com/LuminosoInsight/python-ftfy";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})

{
  lib,
  buildPythonPackage,
  fetchPypi,
  pythonAtLeast,

  # build-system
  hatchling,
  hatch-vcs,

  # dependencies
  param,
  pyyaml,
  requests,

  # tests
}:

buildPythonPackage (finalAttrs: {
  pname = "pyct";
  version = "0.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-1OUTss81thZWBa5fzl8qSZhbxnRzxXnehRNLjHHTdKg=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    param
    pyyaml
    requests
  ];
  # Only the command line doesn't work on with Python 3.12, due to usage of
  # deprecated distutils module. Not disabling it totally.
  disabledTestPaths = lib.optionals (pythonAtLeast "3.12") [
    "pyct/tests/test_cmd.py"
  ];

  pythonImportsCheck = [ "pyct" ];

  meta = {
    description = "ClI for Python common tasks for users";
    mainProgram = "pyct";
    homepage = "https://github.com/pyviz/pyct";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})

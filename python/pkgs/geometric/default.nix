{
  buildPythonPackage,
  lib,
  fetchFromGitHub,
  # build-system
  setuptools,
  networkx,
  numpy,
  scipy,
  six,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "geometric";
  version = "1.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "leeping";
    repo = "geomeTRIC";
    tag = version;
    hash = "sha256-LY5eNKocJL/Ty8tLup6q2o5RkGfIp6P6Hmju4wF3cDw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    networkx
    numpy
    scipy
    six
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  meta = {
    description = "Geometry optimization code for molecular structures";
    mainProgram = "geometric-optimize";
    homepage = "https://github.com/leeping/geomeTRIC";
    license = lib.licenses.bsd3;
  };
}

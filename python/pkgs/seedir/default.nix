{ lib
, buildPythonPackage
, fetchFromGitHub
, natsort
, setuptools
,
}:

buildPythonPackage rec {
  pname = "seedir";
  version = "0.5.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "earnestt1234";
    repo = "seedir";
    tag = "v${version}";
    hash = "sha256-o2CUK00WdoYyLqbDlh+wa30Q23ZkWZC+RvGDCSiCwH4=";
  };

  build-system = [ setuptools ];

  dependencies = [ natsort ];

  pythonImportsCheck = [ "seedir" ];

  meta = {
    description = "Module for creating, editing, and reading folder tree diagrams";
    homepage = "https://github.com/earnestt1234/seedir";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "seedir";
  };
}

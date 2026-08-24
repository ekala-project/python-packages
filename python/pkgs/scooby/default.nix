{ lib
, buildPythonPackage
, fetchFromGitHub
, psutil
, setuptools-scm
,
}:

buildPythonPackage rec {
  pname = "scooby";
  version = "0.11.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "banesullivan";
    repo = "scooby";
    tag = "v${version}";
    hash = "sha256-PP54hFyoM+QdKik9Gj0H6JhF8Ypqnh9yO/Z42O6NO4A=";
  };

  build-system = [ setuptools-scm ];

  optional-dependencies = {
    cpu = [
      psutil
      # mkl
    ];
  };

  meta = {
    description = "Lightweight tool for reporting Python package versions and hardware resources";
    mainProgram = "scooby";
    homepage = "https://github.com/banesullivan/scooby";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

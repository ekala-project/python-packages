{ lib
, buildPythonPackage
, fetchFromGitHub
, gitUpdater
, setuptools
, pkg-config
, yajl
,
}:

buildPythonPackage rec {
  pname = "jsonslicer";
  version = "0.1.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "AMDmi3";
    repo = "jsonslicer";
    tag = version;
    hash = "sha256-nPifyqr+MaFqoCYFbFSSBDjvifpX0CFnHCdMCvhwYTA=";
  };

  build-system = [
    setuptools
    pkg-config
  ];

  buildInputs = [ yajl ];

  pythonImportsCheck = [ "jsonslicer" ];

  passthru.updateScript = gitUpdater { };

  meta = {
    description = "Stream JSON parser for Python";
    homepage = "https://github.com/AMDmi3/jsonslicer";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

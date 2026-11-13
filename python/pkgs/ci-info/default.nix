{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage (finalAttrs: {
  pname = "ci-info";
  version = "0.4.0";
  pyproject = true;

  src = fetchPypi {
    pname = "ci_info";
    inherit (finalAttrs) version;
    hash = "sha256-NNWhhyazeAq9+YUjS4cawzEk1k3Y4pSHC4zFtBDBhBg=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonImportsCheck = [ "ci_info" ];

  meta = {
    description = "Gather continuous integration information on the fly";
    homepage = "https://github.com/mgxd/ci-info";
    license = lib.licenses.mit;
  };
})

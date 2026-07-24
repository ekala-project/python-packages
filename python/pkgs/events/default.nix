{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "events";
  version = "0.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyeve";
    repo = "events";
    tag = "v${version}";
    hash = "sha256-GGhIKHbJ31IN0Uoe689X9V/MZvtseE47qx2CmM4MYUs=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "events" ];

  meta = {
    description = "Bringing the elegance of C# EventHandler to Python";
    homepage = "https://events.readthedocs.org";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}

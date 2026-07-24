{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "coverage";
  version = "7.15.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "coveragepy";
    repo = "coveragepy";
    tag = finalAttrs.version;
    hash = "sha256-ZkZ2TAq1JoI1Sl8gPSBEvLX6yP/uf0Lfc4vaWfjCNEY=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "coverage" ];

  meta = {
    description = "Code coverage measurement for Python";
    homepage = "https://github.com/coveragepy/coveragepy";
    license = lib.licenses.asl20;
  };
})

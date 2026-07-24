{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage (finalAttrs: {
  pname = "inject";
  version = "5.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ivankorobkov";
    repo = "python-inject";
    tag = "v${finalAttrs.version}";
    hash = "sha256-ITnqTGCOPLzATisAcPi52cpxsm9/Adj/Xb53jd18IWo=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonImportsCheck = [ "inject" ];

  meta = {
    description = "Python dependency injection framework";
    homepage = "https://github.com/ivankorobkov/python-inject";
    license = lib.licenses.asl20;
  };
})

{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  python,
  setuptools,
  setuptools-scm,
  which,
}:

buildPythonPackage rec {
  pname = "nodeenv";
  version = "1.10.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ekalinin";
    repo = "nodeenv";
    tag = version;
    hash = "sha256-CosZOTWxXFGrc2ZvPPUwFcUv1blZhyl8MWPnoRCpBBo=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  preFixup = ''
    substituteInPlace $out/${python.sitePackages}/nodeenv.py \
      --replace '["which", candidate]' '["${lib.getBin which}/bin/which", candidate]'
  '';

  pythonImportsCheck = [ "nodeenv" ];

  meta = {
    description = "Node.js virtual environment builder";
    mainProgram = "nodeenv";
    homepage = "https://github.com/ekalinin/nodeenv";
    license = lib.licenses.bsd3;
  };
}

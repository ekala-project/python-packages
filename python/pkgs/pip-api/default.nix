{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pip,
  pretend,
  setuptools,
  virtualenv,
}:

buildPythonPackage (finalAttrs: {
  pname = "pip-api";
  version = "0.0.34";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "di";
    repo = "pip-api";
    tag = "v${finalAttrs.version}";
    hash = "sha256-nmCP4hp+BsD80OBjerOu+QTBBExGHvn/v19od4V3ncI=";
  };

  build-system = [ setuptools ];

  dependencies = [ pip ];
  pythonImportsCheck = [ "pip_api" ];
  meta = {
    description = "Importable pip API";
    homepage = "https://github.com/di/pip-api/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})

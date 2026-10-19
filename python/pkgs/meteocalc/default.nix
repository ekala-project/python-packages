{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "meteocalc";
  version = "1.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "malexer";
    repo = "meteocalc";
    tag = version;
    hash = "sha256-WuIW6hROQkjMfbCLUouECIrp4s6oCd2/N79hsrTbVTk=";
  };

  build-system = [ setuptools ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "meteocalc" ];

  meta = {
    description = "Module for calculation of meteorological variables";
    homepage = "https://github.com/malexer/meteocalc";
    license = lib.licenses.mit;
  };
}

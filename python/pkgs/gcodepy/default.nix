{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "gcodepy";
  version = "0.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "rmeno12";
    repo = "gcodepy";
    tag = "v${finalAttrs.version}";
    hash = "sha256-+amBkwwISPyes8ABdqgCw50Zg5ioDa46WZgQsZZgl+8=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "gcodepy" ];

  meta = {
    description = "G-code generator for 3D printers that use Marlin Firmware";
    homepage = "https://github.com/rmeno12/gcodepy";
    license = lib.licenses.mit;
  };
})

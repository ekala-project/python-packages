{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  prompt-toolkit,
  setuptools,
  winacl,
}:

buildPythonPackage (finalAttrs: {
  pname = "aiowinreg";
  version = "0.0.13";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "skelsec";
    repo = "aiowinreg";
    tag = finalAttrs.version;
    hash = "sha256-vY5SrGTFH/xsv9k2WciE0xNx9r3W53sxxLGXFX34EuE=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [
    prompt-toolkit
    winacl
  ];

  # Project doesn't have tests

  pythonImportsCheck = [ "aiowinreg" ];

  meta = {
    description = "Python module to parse the registry hive";
    homepage = "https://github.com/skelsec/aiowinreg";
    license = lib.licenses.mit;
    mainProgram = "awinreg";
  };
})

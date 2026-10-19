{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  pyopenssl,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "netio";
  version = "1.0.13";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "netioproducts";
    repo = "PyNetio";
    tag = "v${finalAttrs.version}";
    hash = "sha256-s/X2WGhQXYsbo+ZPpkVSF/vclaThYYNHu0UY0yCnfPA=";
  };

  nativeBuildInputs = [
    poetry-core
  ];

  pythonRelaxDeps = [ "pyopenssl" ];

  dependencies = [
    requests
    pyopenssl
  ];

  pythonImportsCheck = [ "Netio" ];

  # Module has no tests

  meta = {
    description = "Module for interacting with NETIO devices";
    mainProgram = "Netio";
    homepage = "https://github.com/netioproducts/PyNetio";
    license = lib.licenses.mit;
  };
})

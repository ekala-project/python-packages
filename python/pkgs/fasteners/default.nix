{
  lib,
  fetchFromGitHub,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "fasteners";
  version = "0.20";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "harlowja";
    repo = "fasteners";
    tag = finalAttrs.version;
    hash = "sha256-h8hlx3yl1+EgqCGE02O+wLejwxgJ5ZOs6nPrYUtHwn0=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "fasteners" ];

  meta = {
    description = "Module that provides useful locks";
    homepage = "https://github.com/harlowja/fasteners";
    changelog = "https://github.com/harlowja/fasteners/releases/tag/${finalAttrs.version}";
    license = lib.licenses.asl20;
  };
})

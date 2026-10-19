{
  lib,
  buildPythonPackage,
  construct,
  packaging,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "snapcast";
  version = "2.3.8";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "happyleavesaoc";
    repo = "python-snapcast";
    tag = finalAttrs.version;
    hash = "sha256-AWGpKtkki5I7VkKSSOBKUss2ULzOKVuKP/8mrU3VmqI=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [
    construct
    packaging
  ];

  pythonImportsCheck = [ "snapcast" ];

  meta = {
    description = "Control Snapcast, a multi-room synchronous audio solution";
    homepage = "https://github.com/happyleavesaoc/python-snapcast/";
    license = lib.licenses.mit;
  };
})

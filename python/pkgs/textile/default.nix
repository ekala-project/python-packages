{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  nh3,
  pillow,
  regex,
  setuptools-scm,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "textile";
  version = "4.0.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "textile";
    repo = "python-textile";
    tag = finalAttrs.version;
    hash = "sha256-fHji+TOIFVljkvlOaRp/8EnZ6KYgMu/DLpg6PmOSEbk=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    nh3
    regex
  ];

  optional-dependencies = {
    imagesize = [ pillow ];
  };

  pythonImportsCheck = [ "textile" ];

  meta = {
    description = "Module for generating web text";
    homepage = "https://github.com/textile/python-textile";
    license = lib.licenses.bsd3;
    maintainers = [ ];
    mainProgram = "pytextile";
  };
})

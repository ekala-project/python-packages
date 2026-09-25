{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "mitogen";
  version = "0.3.53";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mitogen-hq";
    repo = "mitogen";
    tag = "v${finalAttrs.version}";
    hash = "sha256-YtQl3pII/SLYA9Ekm48n2naYEixHWFEaXg7gtuPXfmU=";
  };

  build-system = [ setuptools ];

  # Tests require network access and Docker support
  doCheck = false;

  pythonImportsCheck = [ "mitogen" ];

  meta = {
    description = "Python Library for writing distributed self-replicating programs";
    homepage = "https://github.com/mitogen-hq/mitogen";
    license = lib.licenses.bsd3;
  };
})

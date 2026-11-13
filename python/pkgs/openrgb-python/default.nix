{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "openrgb-python";
  version = "0.3.8";
  pyproject = true;

  # PyPI only ships a wheel for 0.3.8
  src = fetchFromGitHub {
    owner = "jath03";
    repo = "openrgb-python";
    tag = "v${finalAttrs.version}";
    hash = "sha256-AncGoP4M++lkjGUw+3wGx2bGajqeCPB7hZWf0dAcCSE=";
  };

  build-system = [ setuptools ];

  # Module has no tests

  pythonImportsCheck = [ "openrgb" ];

  meta = {
    description = "Module for the OpenRGB SDK";
    homepage = "https://openrgb-python.readthedocs.io/";
    license = lib.licenses.gpl3Only;
  };
})

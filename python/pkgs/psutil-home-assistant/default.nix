{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  psutil,
}:

buildPythonPackage (finalAttrs: {
  pname = "psutil-home-assistant";
  version = "0.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "home-assistant-libs";
    repo = "psutil-home-assistant";
    tag = finalAttrs.version;
    hash = "sha256-6bj1aaa/JYZFVwUAJfxISRoldgTmumCG8WrlKhkb6kM=";
  };

  build-system = [ setuptools ];

  dependencies = [ psutil ];

  meta = {
    description = "Wrapper of psutil that removes reliance on globals";
    homepage = "https://github.com/home-assistant-libs/psutil-home-assistant";
    license = lib.licenses.asl20;
  };
})

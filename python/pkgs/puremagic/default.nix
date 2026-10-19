{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "puremagic";
  version = "2.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "cdgriffith";
    repo = "puremagic";
    tag = finalAttrs.version;
    hash = "sha256-Mvhn/1xcgYgVkWok2qZXAe40pocfu6nJo5xuPruw2dc=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "puremagic" ];

  meta = {
    description = "Implementation of magic file detection";
    homepage = "https://github.com/cdgriffith/puremagic";
    changelog = "https://github.com/cdgriffith/puremagic/blob/${src.tag}/CHANGELOG.md";
    license = lib.licenses.mit;
  };
})

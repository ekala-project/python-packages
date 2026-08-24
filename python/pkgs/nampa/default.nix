{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  unstableGitUpdater,
}:

buildPythonPackage {
  pname = "nampa";
  version = "1.0-unstable-2024-12-18";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "thebabush";
    repo = "nampa";
    rev = "cb6a63aae64324f57bdc296064bc6aa2b99ff99a";
    hash = "sha256-4NEfrx5cR6Zk713oBRZBe52mrbHKhs1doJFAdjnobig=";
  };

  build-system = [ setuptools ];

  # Not used for binaryninja as plugin

  pythonImportsCheck = [ "nampa" ];

  passthru.updateScript = unstableGitUpdater { };

  meta = {
    description = "Python implementation of the FLIRT technology";
    homepage = "https://github.com/thebabush/nampa";
    license = lib.licenses.lgpl3Only;
    maintainers = [ ];
  };
}

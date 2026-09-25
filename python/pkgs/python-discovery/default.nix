{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatch-vcs,
  hatchling,

  # dependencies
  filelock,
  platformdirs,

  # tests
  pytest-mock,
}:

buildPythonPackage (finalAttrs: {
  pname = "python-discovery";
  version = "1.6.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "tox-dev";
    repo = "python-discovery";
    tag = finalAttrs.version;
    hash = "sha256-Zb8+oTNfv+GJ6QCDsTPG/Nez829cm2eZ4eaGgIJ2yeU=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  dependencies = [
    filelock
    platformdirs
  ];

  pythonImportsCheck = [ "python_discovery" ];
  meta = {
    description = "Python interpreter discovery";
    homepage = "https://github.com/tox-dev/python-discovery";
    license = lib.licenses.mit;
  };
})

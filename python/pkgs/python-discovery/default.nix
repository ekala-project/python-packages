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
  version = "1.4.2";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "tox-dev";
    repo = "python-discovery";
    tag = finalAttrs.version;
    hash = "sha256-xnQWXXStdgu99riKFW4+O7tqYL4w5f7etjC872q/LWc=";
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
    maintainers = [ ];
  };
})

{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  fetchpatch,
  setuptools,
  setuptools-scm,
  execnet,
  pytest,
  psutil,
  setproctitle,
}:

buildPythonPackage rec {
  pname = "pytest-xdist";
  version = "3.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pytest-dev";
    repo = "pytest-xdist";
    tag = "v${version}";
    hash = "sha256-2x3znm92wo8DCshf5sYK0stnESg0oVXbxsWRAaTj6oQ=";
  };

  patches = [
    (fetchpatch {
      name = "pytest9-compat-1.patch";
      url = "https://github.com/pytest-dev/pytest-xdist/commit/44f4bea2652e06e7cd5d4a063aa2673b5ef701ee.patch";
      hash = "sha256-BQfcr5f4S+e8xZP2UQwr65hp+iVzmbXYAzO/7iE9lmw=";
    })
    (fetchpatch {
      name = "pytest9-compat-2.patch";
      url = "https://github.com/pytest-dev/pytest-xdist/commit/0c984478f39d7a01aa24c061f2581bdfd071cb6a.patch";
      hash = "sha256-zxdKy7Z0m5UB4qwmdrolSYeBUTgMe2bQkkeX+M0RRHs=";
    })
  ];

  build-system = [
    setuptools
    setuptools-scm
  ];

  buildInputs = [ pytest ];

  dependencies = [ execnet ];
  optional-dependencies = {
    psutil = [ psutil ];
    setproctitle = [ setproctitle ];
  };

  # pytest can already use xdist at this point
  # access file system
  setupHook = ./setup-hook.sh;

  meta = {
    description = "Pytest plugin for distributed testing";
    homepage = "https://github.com/pytest-dev/pytest-xdist";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

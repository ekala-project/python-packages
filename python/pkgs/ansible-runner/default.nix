{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  setuptools-scm,
  # dependencies
  packaging,
  pexpect,
  python-daemon,
  pyyaml,
}:

buildPythonPackage rec {
  pname = "ansible-runner";
  version = "2.4.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ansible";
    repo = "ansible-runner";
    tag = version;
    hash = "sha256-QKvc5T80lVt5hgIjylPpza3kJiw+epytimIsxy0oIK0=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools>=45, <=70.0.0" setuptools \
      --replace-fail "setuptools-scm[toml]>=6.2, <=8.1.0" setuptools-scm
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    packaging
    pexpect
    python-daemon
    pyyaml
  ];

  pythonImportsCheck = [ "ansible_runner" ];

  meta = {
    description = "Helps when interfacing with Ansible";
    homepage = "https://github.com/ansible/ansible-runner";
    license = lib.licenses.asl20;
    maintainers = [ ];
    mainProgram = "ansible-runner";
  };
}

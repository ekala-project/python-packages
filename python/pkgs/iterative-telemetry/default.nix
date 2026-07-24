{
  lib,
  appdirs,
  buildPythonPackage,
  distro,
  fetchFromGitHub,
  filelock,
  pytest-mock,
  requests,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "iterative-telemetry";
  version = "0.0.10";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "iterative";
    repo = "telemetry-python";
    tag = version;
    hash = "sha256-+l9JH9MbN+Pai3MIcKZJObzoPGhQipfMd7T8v4SoSws=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [
    requests
    appdirs
    filelock
    distro
  ];
  pythonImportsCheck = [ "iterative_telemetry" ];

  meta = {
    description = "Common library to send usage telemetry";
    homepage = "https://github.com/iterative/iterative-telemetry";
    license = lib.licenses.asl20;
  };
}

{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  requests,
  rich,
  setuptools,
  urllib3,
}:

buildPythonPackage (finalAttrs: {
  pname = "podman";
  version = "5.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "containers";
    repo = "podman-py";
    tag = "v${finalAttrs.version}";
    hash = "sha256-i4eWC1MyBdc+en3W3+4fdeDP79Z2hsk9SIg3PfG0mI0=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    urllib3
  ];

  optional-dependencies = {
    progress_bar = [ rich ];
  };

  pythonImportsCheck = [ "podman" ];

  meta = {
    description = "Python bindings for Podman's RESTful API";
    homepage = "https://github.com/containers/podman-py";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})

{
  lib,
  buildPythonPackage,
  fetchFromGitLab,
  setuptools,
}:

buildPythonPackage {
  pname = "trampoline";
  version = "0.1.2";
  pyproject = true;

  src = fetchFromGitLab {
    owner = "ferreum";
    repo = "trampoline";
    rev = "1d98f39c3015594e2ac8ed48dccc2f393b4dd82b";
    hash = "sha256-A/tuR+QW9sKh76Qjwn1uQxlVJgWrSFzXeBRDdnSi2o4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "trampoline" ];

  meta = {
    description = "Simple and tiny yield-based trampoline implementation for python";
    homepage = "https://gitlab.com/ferreum/trampoline";
    license = lib.licenses.mit;
  };
}

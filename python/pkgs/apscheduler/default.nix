{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools_80,
  setuptools-scm,
  tzlocal,
}:

buildPythonPackage rec {
  pname = "apscheduler";
  version = "3.11.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "agronholm";
    repo = "apscheduler";
    tag = version;
    hash = "sha256-a1EeDOMYH9O5tRBQigZSLp6kBPp81+6biI0s0N79Sck=";
  };

  postPatch = ''
    sed -i "/addopts/d" pyproject.toml
  '';

  build-system = [
    setuptools_80
    setuptools-scm
  ];

  dependencies = [
    tzlocal
  ];
  pythonImportsCheck = [ "apscheduler" ];

  meta = {
    description = "Library that lets you schedule your Python code to be executed";
    homepage = "https://github.com/agronholm/apscheduler";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

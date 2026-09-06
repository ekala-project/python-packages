{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  anyio,
  attrs,
  setuptools_80,
  setuptools-scm,
  tenacity,
  tzlocal,
}:

buildPythonPackage rec {
  pname = "apscheduler";
  version = "4.0.0a6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "agronholm";
    repo = "apscheduler";
    tag = version;
    hash = "sha256-1Gv8Cm0YA6/z2onJu1pSJj0v4lrBLeEfGo+qkJLUwWY=";
  };

  postPatch = ''
    sed -i "/addopts/d" pyproject.toml
  '';

  build-system = [
    setuptools_80
    setuptools-scm
  ];

  dependencies = [
    anyio
    attrs
    tenacity
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

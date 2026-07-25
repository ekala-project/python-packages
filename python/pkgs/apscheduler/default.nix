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
  version = "3.11.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "agronholm";
    repo = "apscheduler";
    tag = version;
    hash = "sha256-AhVlACRg0Xwy9XmFRl29of5uM2aJa5Gv2SzFuJXVCpE=";
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

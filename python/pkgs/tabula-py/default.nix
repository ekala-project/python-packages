{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pkgs,
  distro,
  numpy,
  pandas,
  setuptools,
  setuptools-scm,
  jpype1,
}:

buildPythonPackage rec {
  pname = "tabula-py";
  version = "2.10.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "chezou";
    repo = "tabula-py";
    tag = "v${version}";
    hash = "sha256-PQbwm9ho3XtpmZ7N7ASkrV8gk9Jom+yQKlt2fUa948s=";
  };

  postPatch = ''
    substituteInPlace tabula/backend.py \
      --replace-fail '"java"' '"${lib.getExe pkgs.openjdk}"'
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  buildInputs = [ pkgs.openjdk ];

  dependencies = [
    distro
    numpy
    pandas
    jpype1
  ];

  pythonImportsCheck = [ "tabula" ];

  meta = {
    description = "Module to extract table from PDF into pandas DataFrame";
    homepage = "https://github.com/chezou/tabula-py";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

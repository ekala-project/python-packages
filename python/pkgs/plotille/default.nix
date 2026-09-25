{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
}:

buildPythonPackage rec {
  pname = "plotille";
  version = "6.0.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tammoippen";
    repo = "plotille";
    tag = "v${version}";
    hash = "sha256-oT4zjnLT7umauXroNgffccYLtYsU5sFSG9qBtuGVsuU=";
  };

  build-system = [
    flit-core
  ];

  pythonImportsCheck = [
    "plotille"
  ];

  meta = {
    description = "Plot in the terminal using braille dots";
    homepage = "https://github.com/tammoippen/plotille";
    license = lib.licenses.mit;
  };
}

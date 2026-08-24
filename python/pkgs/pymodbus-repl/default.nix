{
  aiohttp,
  buildPythonPackage,
  doCheck ? false,
  # cyclic dependency with pymodbus
  fetchFromGitHub,
  lib,
  poetry-core,
  prompt-toolkit,
  pygments,
  pymodbus,
  pymodbus-repl,
  tabulate,
  typer,
}:

buildPythonPackage rec {
  pname = "pymodbus-repl";
  version = "2.0.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pymodbus-dev";
    repo = "repl";
    tag = version;
    hash = "sha256-jGoYp2nDWMWMX8n0aaG/YP+rQcj2npFbhdy7T1qxByc=";
  };

  build-system = [ poetry-core ];

  pythonRelaxDeps = [
    "tabulate"
  ];

  dependencies = [
    aiohttp
    prompt-toolkit
    pygments
    tabulate
    typer
  ];

  pythonImportsCheck = [ "pymodbus_repl" ];

  inherit doCheck;

  meta = {
    description = "REPL client and server for pymodbus";
    homepage = "https://github.com/pymodbus-dev/repl";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

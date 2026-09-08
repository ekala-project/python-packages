{
  lib,
  aiohttp,
  buildPythonPackage,
  fetchFromGitHub,
  pymodbus-repl,
  pyserial,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pymodbus";
  version = "3.15.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pymodbus-dev";
    repo = "pymodbus";
    tag = "v${finalAttrs.version}";
    hash = "sha256-8zBbGvqni5/P1UP+ByPGTZJ5SyydrisuJcg1BntucWE=";
  };

  build-system = [ setuptools ];

  optional-dependencies = {
    repl = [ pymodbus-repl ];
    serial = [ pyserial ];
    simulator = [ aiohttp ];
  };

  pythonImportsCheck = [ "pymodbus" ];

  meta = {
    description = "Python implementation of the Modbus protocol";
    homepage = "https://github.com/pymodbus-dev/pymodbus";
    license = lib.licenses.bsd3;
    maintainers = [ ];
    mainProgram = "pymodbus.simulator";
  };
})

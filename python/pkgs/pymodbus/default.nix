{ lib
, aiohttp
, buildPythonPackage
, fetchFromGitHub
, pymodbus-repl
, pyserial
, setuptools
,
}:

buildPythonPackage (finalAttrs: {
  pname = "pymodbus";
  version = "3.14.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pymodbus-dev";
    repo = "pymodbus";
    tag = "v${finalAttrs.version}";
    hash = "sha256-abU7hOXXJuoBHqSCL4++4ZHZcG8hcyLCMw56eBz1eQc=";
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

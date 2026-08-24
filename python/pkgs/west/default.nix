{ lib
, buildPythonPackage
, setuptools
, colorama
, fetchPypi
, packaging
, pykwalify
, pyyaml
,
}:

buildPythonPackage rec {
  pname = "west";
  version = "1.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-cIj+Dpr+Bxnr7pXFHFKRSfe8/JGdg6ggbTX6nGg+0KU=";
  };

  build-system = [ setuptools ];

  dependencies = [
    colorama
    packaging
    pyyaml
    pykwalify
  ];

  # pypi package does not include tests (and for good reason):

  pythonImportsCheck = [ "west" ];

  meta = {
    description = "Zephyr RTOS meta tool";
    mainProgram = "west";
    homepage = "https://github.com/zephyrproject-rtos/west";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}

{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  six,
}:

buildPythonPackage rec {
  pname = "pyvcd";
  version = "0.4.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-3GJ16Vp5SbgjYIarLm0Dr+3nNEEkPsUQnJ6okHfz1pY=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ six ];

  pythonImportsCheck = [ "vcd" ];

  meta = {
    description = "Python package for writing Value Change Dump (VCD) files";
    homepage = "https://github.com/SanDisk-Open-Source/pyvcd";
    changelog = "https://github.com/SanDisk-Open-Source/pyvcd/blob/${version}/CHANGELOG.rst";
    license = lib.licenses.mit;
  };
}

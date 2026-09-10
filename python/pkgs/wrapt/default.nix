{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "wrapt";
  version = "2.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "GrahamDumpleton";
    repo = "wrapt";
    tag = version;
    hash = "sha256-LzHiX23w6idv7xV7N2XA3vcaV2tzaivP7Dut/EkvzFE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "wrapt" ];

  meta = {
    description = "Module for decorators, wrappers and monkey patching";
    homepage = "https://github.com/GrahamDumpleton/wrapt";
    license = lib.licenses.bsd2;
  };
}

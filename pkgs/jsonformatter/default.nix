{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "jsonformatter";
  version = "0.3.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-r3GuFTSoDW9g+NXue/pwwuRTie2APtlCOfQwW3xoEF0=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "jsonformatter" ];

  meta = {
    description = "Formatter to output JSON log";
    homepage = "https://github.com/MyColorfulDays/jsonformatter";
    license = lib.licenses.bsd2;
  };
}

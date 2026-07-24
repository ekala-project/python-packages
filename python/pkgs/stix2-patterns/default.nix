{
  lib,
  antlr4-python3-runtime,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "stix2-patterns";
  version = "2.1.2";
  pyproject = true;

  src = fetchPypi {
    pname = "stix2_patterns";
    inherit version;
    hash = "sha256-sgWdNsH9h3QPP6zCKkFHzeHisKy41eTAj78EsdxVMYU=";
  };

  build-system = [ setuptools ];

  dependencies = [ antlr4-python3-runtime ];

  pythonImportsCheck = [ "stix2patterns" ];

  meta = {
    description = "Validate patterns used to express cyber observable content in STIX Indicators";
    homepage = "https://github.com/oasis-open/cti-pattern-validator";
    license = lib.licenses.bsd3;
  };
}

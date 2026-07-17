{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "plac";
  version = "1.4.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-XwW/hSNcAX/Ndsc8gQHU/46WvrPcWLmjfeScrH3oLRQ=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "plac" ];

  meta = {
    description = "Parsing the Command Line the Easy Way";
    homepage = "https://github.com/ialbert/plac";
    license = lib.licenses.bsdOriginal;
  };
}

{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "plac";
  version = "1.4.7";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-lX/7q46oq4wLnyaU2qKpXzVgFRzRYry8kel/+U1FxPk=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "plac" ];

  meta = {
    description = "Parsing the Command Line the Easy Way";
    homepage = "https://github.com/ialbert/plac";
    license = lib.licenses.bsdOriginal;
  };
}

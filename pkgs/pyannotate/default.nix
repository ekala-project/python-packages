{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  six,
  mypy-extensions,
}:

buildPythonPackage rec {
  pname = "pyannotate";
  version = "1.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-BO1YBLqzgVPVmB/JLYPc9qIog0U3aFYfBX53flwFdZk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    six
    mypy-extensions
  ];

  pythonImportsCheck = [ "pyannotate_runtime" ];

  meta = {
    description = "Auto-generate PEP-484 annotations";
    homepage = "https://github.com/dropbox/pyannotate";
    license = lib.licenses.mit;
  };
}

{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "aenum";
  version = "3.1.17";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-qWmkUWsZSJXecsh17ONV8XwNJyFG9/2jRu90+Tz01bo=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "aenum" ];

  meta = {
    description = "Advanced Enumerations (compatible with Python's stdlib Enum), NamedTuples, and NamedConstants";
    homepage = "https://github.com/ethanfurman/aenum";
    license = lib.licenses.bsd3;
  };
}

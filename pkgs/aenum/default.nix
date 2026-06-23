{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "aenum";
  version = "3.1.16";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-v6+Vib20GO46mG2FdQxzGNnSg5wbGh1v6PxT7CAc8UA=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "aenum" ];

  meta = {
    description = "Advanced Enumerations (compatible with Python's stdlib Enum), NamedTuples, and NamedConstants";
    homepage = "https://github.com/ethanfurman/aenum";
    license = lib.licenses.bsd3;
  };
}

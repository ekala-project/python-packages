{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  py,
  pytest-benchmark,
  setuptools,
}:

buildPythonPackage rec {
  pname = "sqlitedict";
  version = "2.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "RaRe-Technologies";
    repo = "sqlitedict";
    tag = "v${version}";
    hash = "sha256-GfvvkQ6a75UBPn70IFOvjvL1MedSc4siiIjA3IsQnic=";
  };

  nativeBuildInputs = [ setuptools ];
  pythonImportsCheck = [ "sqlitedict" ];
  meta = {
    description = "Persistent, thread-safe dict";
    homepage = "https://github.com/RaRe-Technologies/sqlitedict";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}

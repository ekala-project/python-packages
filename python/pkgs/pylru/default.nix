{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pylru";
  version = "1.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jlhutch";
    repo = "pylru";
    tag = "v${version}";
    hash = "sha256-3qycUYmnLGiuNsrBOCL/QiRkrPVikaRqVBmQFURDGKs=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pylru" ];

  meta = {
    description = "Least recently used (LRU) cache implementation";
    homepage = "https://github.com/jlhutch/pylru";
    license = lib.licenses.mit;
  };
}

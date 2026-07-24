{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytest-xprocess,
}:

buildPythonPackage rec {
  pname = "cachelib";
  version = "0.13.0";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "pallets";
    repo = "cachelib";
    tag = version;
    hash = "sha256-8jg+zfdIATvu/GSFvqHl4cNMu+s2IFWC22vPZ7Q3WYI=";
  };
  pythonImportsCheck = [ "cachelib" ];

  meta = {
    homepage = "https://github.com/pallets/cachelib";
    description = "Collection of cache libraries in the same API interface";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}

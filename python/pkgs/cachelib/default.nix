{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  pytest-xprocess,
}:

buildPythonPackage rec {
  pname = "cachelib";
  version = "0.17.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pallets";
    repo = "cachelib";
    tag = version;
    hash = "sha256-egAg0X4xpbvtiAXU6Cu/IIs8/GJAy5i73gLIkdnvOmc=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "cachelib" ];

  meta = {
    homepage = "https://github.com/pallets/cachelib";
    description = "Collection of cache libraries in the same API interface";
    license = lib.licenses.bsd3;
  };
}

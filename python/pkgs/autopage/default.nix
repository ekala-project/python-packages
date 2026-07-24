{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "autopage";
  version = "0.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-QtB96Q3mPoN2KCgCi/1W0ZkGoY98lR727vPprUijBx0=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "autopage" ];

  meta = {
    homepage = "https://github.com/zaneb/autopage";
    description = "Library to provide automatic paging for console output";
    license = lib.licenses.asl20;
  };
}

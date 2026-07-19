{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "zict";
  version = "3.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-4yHiY7apeq/AeQw8+zwEZWtwZuZzjDf//MqV2APJ+6U=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "zict" ];

  meta = {
    description = "Mutable mapping tools";
    homepage = "https://github.com/dask/zict";
    license = lib.licenses.bsd3;
  };
}

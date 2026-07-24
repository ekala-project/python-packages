{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  psutil,
}:

buildPythonPackage rec {
  pname = "pyperf";
  version = "2.10.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-3ZPM/aeSFHJSk+lfH6bgDLSmStzxMmA5SG1OH5HKqmI=";
  };

  build-system = [ setuptools ];

  dependencies = [ psutil ];

  pythonImportsCheck = [ "pyperf" ];

  meta = {
    description = "Python module to generate and modify perf";
    homepage = "https://pyperf.readthedocs.io/";
    license = lib.licenses.mit;
  };
}

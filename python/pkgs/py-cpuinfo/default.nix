{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "py-cpuinfo";
  version = "9.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-PNu/P6yQ3G8Ri/1kOE8wnt6t2QLXyPsX8C/6H8P0lpA=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "cpuinfo" ];

  meta = {
    description = "Get CPU info with pure Python";
    homepage = "https://github.com/workhorsy/py-cpuinfo";
    license = lib.licenses.mit;
  };
}

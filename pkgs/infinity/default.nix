{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "infinity";
  version = "1.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-jap8Fc4hAP3M/eISM34M1c8IWGn1TcJjS2ww1hRh7No=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "infinity" ];

  meta = {
    homepage = "https://github.com/kvesteri/infinity";
    description = "All-in-one infinity value for Python";
    license = lib.licenses.bsd3;
  };
}

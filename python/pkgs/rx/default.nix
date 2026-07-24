{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "Rx";
  version = "3.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-tlfKK0WqSF2i99z9CfrC5VT3rFH/PC+PL/li7Nlj2Rw=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "rx" ];

  meta = {
    description = "Reactive Extensions for Python";
    homepage = "https://github.com/ReactiveX/RxPY";
    license = lib.licenses.asl20;
  };
}

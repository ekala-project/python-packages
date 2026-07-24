{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "resolvelib";
  version = "1.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-fQiiAi9uFs5AXWC2jDkPBU78/QR31Lm9AZzJQcKPrRw=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "resolvelib" ];

  meta = {
    homepage = "https://github.com/sarugaku/resolvelib";
    description = "Resolve abstract dependencies into concrete ones";
    license = lib.licenses.isc;
  };
}

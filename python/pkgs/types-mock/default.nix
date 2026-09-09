{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "types_mock";
  version = "5.2.0.20260518";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Sa+cGKrEyqkODh6EN+IWDNiz8SYFPa5kU9ZbOTWQ/Pk=";
  };

  build-system = [ setuptools ];

  meta = {
    description = "Type stub package for the mock package";
    homepage = "https://pypi.org/project/types-mock";
    license = lib.licenses.asl20;
  };
}

{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "cachy";
  version = "0.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-GGWB9M60Kgu+BAxAfac8FAkjebHkwOMn/bcq5KmyabE=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "cachy" ];

  meta = {
    description = "Cachy provides a simple yet effective caching library";
    homepage = "https://github.com/sdispater/cachy";
    license = lib.licenses.mit;
  };
}

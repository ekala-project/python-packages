{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "genson";
  version = "1.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-vH8cG66HohykTYEUmuyVo/RGjWdt6biwjKoGTzxQs9o=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "genson" ];

  meta = {
    description = "GenSON a JSON Schema generator built in Python";
    homepage = "https://github.com/wolverdude/GenSON";
    license = lib.licenses.mit;
  };
}

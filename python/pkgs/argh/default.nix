{
  lib,
  fetchPypi,
  buildPythonPackage,
  flit-core,
}:

buildPythonPackage rec {
  pname = "argh";
  version = "0.31.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-8wAj2L4Uyl7msbPuq4KRUde72kZK4H3E3VNHkZxYkvk=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "argh" ];

  meta = {
    homepage = "https://github.com/neithere/argh";
    description = "Unobtrusive argparse wrapper with natural syntax";
    license = lib.licenses.lgpl3Plus;
  };
}

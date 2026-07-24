{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  genshi,
  lxml,
}:

buildPythonPackage rec {
  pname = "relatorio";
  version = "0.11.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-e6CvclFrRfXR5fL2ZG1LZxTTsTRouLsDicCwvXtySGE=";
  };

  build-system = [ setuptools ];

  dependencies = [
    genshi
    lxml
  ];

  pythonImportsCheck = [ "relatorio" ];

  meta = {
    description = "Templating library able to output odt and pdf files";
    homepage = "https://relatorio.tryton.org/";
    license = lib.licenses.gpl2Plus;
  };
}

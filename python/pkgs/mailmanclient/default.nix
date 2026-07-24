{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  requests,
}:

buildPythonPackage rec {
  pname = "mailmanclient";
  version = "3.3.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Y1gcYEyn6sAhSJwVqsygaklY63b2ZXTG+rBerGVN2Fc=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  pythonImportsCheck = [ "mailmanclient" ];

  meta = {
    description = "REST client for driving Mailman 3";
    homepage = "https://www.gnu.org/software/mailman/";
    license = lib.licenses.lgpl3Plus;
  };
}

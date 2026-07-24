{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage rec {
  pname = "param";
  version = "2.4.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-NkozvYqWiwU9iknTGa943DGzzLlmHsuVwpo+pQnX5EM=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  doCheck = false;

  pythonImportsCheck = [ "param" ];

  meta = {
    homepage = "https://param.holoviz.org/";
    description = "Declarative Python programming using Parameters";
    license = lib.licenses.bsd3;
  };
}

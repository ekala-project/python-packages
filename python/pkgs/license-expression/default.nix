{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools-scm,
  boolean-py,
}:

buildPythonPackage rec {
  pname = "license-expression";
  version = "30.4.4";
  pyproject = true;

  src = fetchPypi {
    pname = "license_expression";
    inherit version;
    hash = "sha256-c0SPCqzY0ICIlb3EssjgGo1nZG5BiPiHN1OYx2HzQP0=";
  };

  dontConfigure = true;

  build-system = [ setuptools-scm ];

  dependencies = [ boolean-py ];

  pythonImportsCheck = [ "license_expression" ];

  meta = {
    description = "Utility library to parse, normalize and compare License expressions";
    homepage = "https://github.com/aboutcode-org/license-expression";
    license = lib.licenses.asl20;
  };
}

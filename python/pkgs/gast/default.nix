{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "gast";
  version = "0.7.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-C7FM0bgGci6R3bq2+4a7oUjCK0Dn/xHiSJdOBMit/a4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "gast" ];

  meta = {
    description = "Compatibility layer between the AST of various Python versions";
    homepage = "https://github.com/serge-sans-paille/gast/";
    license = lib.licenses.bsd3;
  };
}

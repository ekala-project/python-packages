{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "beaker";
  version = "1.13.0";
  pyproject = true;

  src = fetchPypi {
    pname = "Beaker";
    inherit version;
    hash = "sha256-6VbNijWtXeG1ISx7/4/AHis9NKuSRm0kaExmaruMnDA=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "beaker" ];

  meta = {
    homepage = "https://github.com/bbangert/beaker";
    description = "Session and Caching library with WSGI Middleware";
    license = lib.licenses.bsd3;
  };
}

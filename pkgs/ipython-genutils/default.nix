{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "ipython-genutils";
  version = "0.2.0";
  pyproject = true;

  src = fetchPypi {
    pname = "ipython_genutils";
    inherit version;
    hash = "sha256-6y4RbnXs751NIo/cZq9UJpr6JqtEYwQuM3hbiHxii6g=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "ipython_genutils" ];

  meta = {
    description = "Vestigial utilities from IPython";
    homepage = "https://ipython.org/";
    license = lib.licenses.bsd3;
  };
}

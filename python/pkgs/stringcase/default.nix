{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "stringcase";
  version = "1.2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-SKBpgGYZCO/o2dNOqytsE676IWOzztJpcpAuO9/YcAg=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "stringcase" ];

  meta = {
    description = "Convert string cases between camel case, pascal case, snake case etc";
    homepage = "https://github.com/okunishinishi/python-stringcase";
    license = lib.licenses.mit;
  };
}

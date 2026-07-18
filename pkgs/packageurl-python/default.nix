{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "packageurl-python";
  version = "0.17.6";
  pyproject = true;

  src = fetchPypi {
    pname = "packageurl_python";
    inherit version;
    hash = "sha256-ElLOOhAjcspvhuuWjhb5AUxLpRHFw32Vp/Aj4spuXCU=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "packageurl" ];

  meta = {
    description = "Python parser and builder for package URLs";
    homepage = "https://github.com/package-url/packageurl-python";
    license = lib.licenses.mit;
  };
}

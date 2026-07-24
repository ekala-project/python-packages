{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "schema";
  version = "0.7.8";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-6GzAjt1v5uJSJkj05H46MZIKdugszok3U1Qi4xCGKrU=";
  };

  nativeBuildInputs = [ setuptools ];

  pythonImportsCheck = [ "schema" ];

  meta = {
    homepage = "https://github.com/keleshev/schema";
    description = "Library for validating Python data structures";
    license = lib.licenses.mit;
  };
}

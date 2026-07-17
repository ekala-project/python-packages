{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "sh";
  version = "2.2.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-ZTInp8QaKE7FMCFz+8BE7oF8e61ebk2NVXQbmuuetls=";
  };

  build-system = [ poetry-core ];

  doCheck = false;

  pythonImportsCheck = [ "sh" ];

  meta = {
    description = "Python subprocess interface";
    homepage = "https://pypi.org/project/sh/";
    license = lib.licenses.mit;
  };
}

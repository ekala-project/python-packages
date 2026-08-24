{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  httpx,
  tomli,
  starlette,
}:

buildPythonPackage rec {
  pname = "wn";
  version = "0.14.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-z2mDEFx7Qn5LKyji4CgFhxvCUblZeXLf2hjy4i6lMjQ=";
  };

  build-system = [ hatchling ];

  dependencies = [
    httpx
    tomli
  ];

  optional-dependencies.web = [
    starlette
  ];

  pythonImportsCheck = [ "wn" ];

  meta = {
    description = "Modern, interlingual wordnet interface for Python";
    homepage = "https://github.com/goodmami/wn";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

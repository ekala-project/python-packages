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
  version = "1.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-BVXqh18T32SPNDucYiFT5Pce5CvJ1XoA8mDhko+GsSg=";
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

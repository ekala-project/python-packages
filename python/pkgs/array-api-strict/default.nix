{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
  numpy,
  hypothesis,
}:

buildPythonPackage rec {
  pname = "array-api-strict";
  version = "2.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "data-apis";
    repo = "array-api-strict";
    tag = version;
    hash = "sha256-jDigE1bCx2JbthIPuVd3dX1tdvGqcZVOR3opJwlTme4=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools >= 61.0,<=75" "setuptools"
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ numpy ];
pythonImportsCheck = [ "array_api_strict" ];
meta = {
    homepage = "https://data-apis.org/array-api-strict";
    description = "Strict, minimal implementation of the Python array API";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}

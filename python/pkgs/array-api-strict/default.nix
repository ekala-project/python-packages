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
  version = "2.6.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "data-apis";
    repo = "array-api-strict";
    tag = version;
    hash = "sha256-0ccyNbp6GheG1KtImpa/2uboAG6Q+rHdwKaqupBuoPg=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools >= 61.0,<=75" "setuptools" \
      --replace-fail "setuptools_scm>8,<10" "setuptools_scm"
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

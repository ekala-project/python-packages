{ lib
, buildPythonPackage
, fetchPypi
, astropy
, requests
, setuptools
, setuptools-scm
,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyvo";
  version = "1.8.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-08xgqj00FtIsieRloE36n1IQhf3VIozOLP/S/uOp5wk=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    astropy
    requests
  ];

  pythonImportsCheck = [ "pyvo" ];

  meta = {
    description = "Astropy affiliated package for accessing Virtual Observatory data and services";
    homepage = "https://github.com/astropy/pyvo";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})

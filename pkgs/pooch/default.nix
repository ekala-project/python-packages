{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  packaging,
  platformdirs,
  requests,
}:

buildPythonPackage rec {
  pname = "pooch";
  version = "1.8.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-dlYfDeaKAdpN9q846ZVcTJ0aXJDac/fkAnalco7IPRA=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    packaging
    platformdirs
    requests
  ];

  pythonImportsCheck = [ "pooch" ];

  meta = {
    description = "Friend to fetch your data files";
    homepage = "https://github.com/fatiando/pooch";
    license = lib.licenses.bsd3;
  };
}

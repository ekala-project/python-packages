{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  versioneer,
  sphinx,
}:

buildPythonPackage rec {
  pname = "autodocsumm";
  version = "0.2.15";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-6vQx56WjnkGiFTERc8i5XoOFkFnfHM87ecZL89VYKzw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    versioneer
    sphinx
  ];

  pythonImportsCheck = [ "autodocsumm" ];

  meta = {
    description = "Extended sphinx autodoc including automatic autosummaries";
    homepage = "https://github.com/Chilipp/autodocsumm";
    license = lib.licenses.asl20;
  };
}

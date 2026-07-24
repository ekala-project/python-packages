{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "deepmerge";
  version = "2.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-B8p6e4k131lsUS+oFhh3wEh6xh9pHAd2bn1x0rI73S8=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "deepmerge" ];

  meta = {
    description = "Toolset to deeply merge python dictionaries";
    homepage = "https://github.com/toumorokoshi/deepmerge";
    license = lib.licenses.mit;
  };
}

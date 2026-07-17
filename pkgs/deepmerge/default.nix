{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "deepmerge";
  version = "2.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-XD2GCB++vQTdXeA2JqBge4CamPtsy6V3C2JGb+lA/yA=";
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

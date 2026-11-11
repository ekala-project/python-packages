{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  importlib-metadata,
}:

buildPythonPackage (finalAttrs: {
  pname = "importlib-resources";
  version = "7.1.0";
  pyproject = true;

  src = fetchPypi {
    pname = "importlib_resources";
    inherit (finalAttrs) version;
    hash = "sha256-ByLUxiEkicUw8qFFo0wKejtHIbyWoV+tpZMOKgt2Bwg=";
  };

  # coherent.licensed is only used to infer license metadata, which is already declared
  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"coherent.licensed",' ""
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [ importlib-metadata ];

  pythonImportsCheck = [ "importlib_resources" ];

  meta = {
    description = "Read resources from Python packages";
    homepage = "https://importlib-resources.readthedocs.io/";
    license = lib.licenses.asl20;
  };
})

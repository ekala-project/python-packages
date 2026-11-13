{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "types-python-dateutil";
  version = "2.9.0.20261104";
  pyproject = true;

  src = fetchPypi {
    pname = "types_python_dateutil";
    inherit (finalAttrs) version;
    hash = "sha256-XQSVcCpfc0N0H12ELFMbzRyUHai0qFMH1S70O6gCUts=";
  };

  build-system = [ setuptools ];

  # Modules doesn't have tests

  pythonImportsCheck = [ "dateutil-stubs" ];

  meta = {
    description = "Typing stubs for python-dateutil";
    homepage = "https://github.com/python/typeshed";
    license = lib.licenses.asl20;
  };
})

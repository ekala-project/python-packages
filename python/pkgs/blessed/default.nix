{
  lib,
  fetchPypi,
  buildPythonPackage,
  flit-core,
  jinxed,
  wcwidth,
}:

buildPythonPackage (finalAttrs: {
  pname = "blessed";
  version = "1.52.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-pvQrKHXHr+54QgrJkZaZ1cPc41v6mtRbwVixcT/DPQ0=";
  };

  build-system = [ flit-core ];

  # wcwidth 0.8.3 already provides the APIs blessed uses
  pythonRelaxDeps = [ "wcwidth" ];

  dependencies = [
    jinxed
    wcwidth
  ];

  pythonImportsCheck = [ "blessed" ];

  meta = {
    homepage = "https://github.com/jquast/blessed";
    description = "Thin, practical wrapper around terminal capabilities in Python";
    license = lib.licenses.mit;
  };
})

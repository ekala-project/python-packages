{
  buildPythonPackage,
  lib,
  fetchPypi,
  # build-system
  setuptools,
  numpy,
}:
let
  pname = "eventkit";
  version = "1.0.3";
  hash = "sha256-mUl/bzxjilD/dhby+M2Iexi7/zdl3BvYaBVU2xRnyTM=";
in
buildPythonPackage {
  pyproject = true;
  inherit pname version;

  src = fetchPypi { inherit pname version hash; };

  build-system = [ setuptools ];

  dependencies = [ numpy ];

  meta = {
    homepage = "https://github.com/erdewit/eventkit";
    description = "Event-driven data pipelines";
    license = lib.licenses.bsd2;
  };
}

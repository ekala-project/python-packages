{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  flask,
  elasticsearch,
}:

buildPythonPackage (finalAttrs: {
  pname = "flask-elastic";
  version = "0.2";
  pyproject = true;

  src = fetchPypi {
    pname = "Flask-Elastic";
    inherit (finalAttrs) version;
    hash = "sha256-XwGm/FQbXSV2qbAlHyAbT4DLcQnIseDm1Qqdb5zjE0M=";
  };

  build-system = [ setuptools ];

  dependencies = [
    flask
    elasticsearch
  ];

  meta = {
    description = "Integrates official client for Elasticsearch into Flask";
    license = lib.licenses.bsd3;
    homepage = "https://github.com/marceltschoppch/flask-elastic";
  };
})

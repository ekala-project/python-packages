{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "lazr-uri";
  version = "4.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "lazr_uri";
    inherit (finalAttrs) version;
    hash = "sha256-1KTkS3yHJpq2wB39TEYLjwSS4jd8QhUVfChZKYiO/lw=";
  };

  build-system = [ setuptools ];

  dependencies = [ setuptools ];

  pythonNamespaces = [ "lazr" ];

  pythonImportsCheck = [ "lazr.uri" ];

  meta = {
    description = "Self-contained, easily reusable library for parsing, manipulating URIs";
    homepage = "https://launchpad.net/lazr.uri";
    license = lib.licenses.lgpl3Only;
  };
})

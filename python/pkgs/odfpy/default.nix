{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  defusedxml,
}:

buildPythonPackage rec {
  pname = "odfpy";
  version = "1.4.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-23ZqblnFEDIS88yS7I3VCg86AnkCM+0LUhSLcNPEOOw=";
  };

  build-system = [ setuptools ];

  dependencies = [ defusedxml ];

  pythonImportsCheck = [ "odf" ];

  doCheck = false;

  meta = {
    homepage = "https://github.com/eea/odfpy";
    description = "Python API and tools to manipulate OpenDocument files";
    license = lib.licenses.asl20;
  };
}

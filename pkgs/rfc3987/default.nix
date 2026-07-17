{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "rfc3987";
  version = "1.3.8";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-08TSV6Vg1UTpgms4vIHbZ2iQx5q516ySs5x6JT1cpzM=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "rfc3987" ];

  meta = {
    description = "Parsing and validation of URIs (RFC 3986) and IRIs (RFC 3987)";
    homepage = "https://pypi.org/project/rfc3987/";
    license = lib.licenses.gpl3Plus;
  };
}

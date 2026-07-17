{
  lib,
  buildPythonPackage,
  fetchPypi,
  flit-core,
}:

buildPythonPackage rec {
  pname = "anyascii";
  version = "0.3.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-yU6d2dR7PZSU7KMF/vlEfQC0vxoyr/hap0b6Psf7lcM=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "anyascii" ];

  meta = {
    description = "Unicode to ASCII transliteration";
    homepage = "https://github.com/anyascii/anyascii";
    license = lib.licenses.isc;
  };
}

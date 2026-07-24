{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "translitcodec";
  version = "0.7.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-O+eXXGMOwPHdWzcSFgyZGpd2EymFrtJYjLoIO6APo8g=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "translitcodec" ];

  meta = {
    homepage = "https://github.com/claudep/translitcodec";
    description = "Unicode to 8-bit charset transliteration codec";
    license = lib.licenses.mit;
  };
}

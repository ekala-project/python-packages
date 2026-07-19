{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
  filetype,
  mutagen,
}:

buildPythonPackage rec {
  pname = "mediafile";
  version = "0.17.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-gMkAP9JdcJanI347WOb/AY72f5w5kA/q+sq6wXQsfTo=";
  };

  build-system = [ poetry-core ];

  dependencies = [
    filetype
    mutagen
  ];

  pythonImportsCheck = [ "mediafile" ];

  meta = {
    description = "Python interface to the metadata tags for many audio file formats";
    homepage = "https://github.com/beetbox/mediafile";
    license = lib.licenses.mit;
  };
}

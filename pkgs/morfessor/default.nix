{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "Morfessor";
  version = "2.0.6";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-uzvqwjQ0FyTF9kD2WAMHH2I3OlDbqFTVo5hWf5rvurI=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "morfessor" ];

  meta = {
    description = "Tool for unsupervised and semi-supervised morphological segmentation";
    homepage = "https://github.com/aalto-speech/morfessor";
    license = lib.licenses.bsd2;
  };
}

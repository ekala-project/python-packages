{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "speaklater";
  version = "1.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Wf6jNtDu04wfC/MYHuEiLQ70Xzqd006+Zea//91qZak=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "speaklater" ];

  meta = {
    description = "Implements a lazy string for python useful for use with gettext";
    homepage = "https://github.com/mitsuhiko/speaklater";
    license = lib.licenses.bsd0;
  };
}

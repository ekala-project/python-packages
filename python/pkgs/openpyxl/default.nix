{
  lib,
  buildPythonPackage,
  et-xmlfile,
  fetchFromGitLab,
  setuptools,
}:

buildPythonPackage rec {
  pname = "openpyxl";
  version = "3.1.5";
  pyproject = true;

  src = fetchFromGitLab {
    domain = "foss.heptapod.net";
    owner = "openpyxl";
    repo = "openpyxl";
    tag = version;
    hash = "sha256-vp+TIWcHCAWlDaBcmC7w/kV7DZTZpa6463NusaJmqKo=";
  };

  build-system = [ setuptools ];

  dependencies = [ et-xmlfile ];

  pythonImportsCheck = [ "openpyxl" ];

  meta = {
    description = "Python library to read/write Excel 2010 xlsx/xlsm files";
    homepage = "https://openpyxl.readthedocs.org";
    license = lib.licenses.mit;
  };
}

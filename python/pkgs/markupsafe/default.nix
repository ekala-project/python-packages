{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "markupsafe";
  version = "3.0.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pallets";
    repo = "markupsafe";
    tag = version;
    hash = "sha256-2d64cItemqVM25WJIKrjExKz6v4UW2wVxM6phH1g1sE=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "markupsafe" ];
  meta = {
    description = "Implements a XML/HTML/XHTML Markup safe string";
    homepage = "https://palletsprojects.com/p/markupsafe/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}

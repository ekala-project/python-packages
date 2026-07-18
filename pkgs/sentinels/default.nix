{
  lib,
  fetchPypi,
  buildPythonPackage,
  hatchling,
  hatch-vcs,
}:

buildPythonPackage rec {
  pname = "sentinels";
  version = "1.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-PC9k91QYfBngoaApsUi3TPWN0S7Ce04ZwOXW4itamoY=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  postPatch = ''sed -i "/testpaths/d" pyproject.toml'';

  pythonImportsCheck = [ "sentinels" ];

  meta = {
    description = "Various objects to denote special meanings in python";
    homepage = "https://github.com/vmalloc/sentinels/";
    license = lib.licenses.bsd3;
  };
}

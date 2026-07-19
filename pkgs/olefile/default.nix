{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "olefile";
  version = "0.47";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    hash = "sha256-WZODOBoL89+9kyygymUVrNF07UiHDL9/7hI9aYwZLBw=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "olefile" ];

  meta = {
    description = "Python package to parse, read and write Microsoft OLE2 files";
    homepage = "https://www.decalage.info/python/olefileio";
    license = with lib.licenses; [
      bsd2
      hpnd
    ];
  };
}

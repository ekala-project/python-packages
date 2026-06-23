{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  cython,
  geos,
  numpy,
  oldest-supported-numpy,
  setuptools,
  wheel,
}:

buildPythonPackage rec {
  pname = "shapely";
  version = "2.1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "shapely";
    repo = "shapely";
    tag = version;
    hash = "sha256-tnnOJsAI3v52ngFOIUIkeDuRIu2JlZGuHreVv4W8LeE=";
  };

  nativeBuildInputs = [
    cython
    geos
    oldest-supported-numpy
    setuptools
    wheel
  ];

  buildInputs = [ geos ];

  dependencies = [ numpy ];

  pythonImportsCheck = [ "shapely" ];

  meta = {
    description = "Manipulation and analysis of geometric objects";
    homepage = "https://github.com/shapely/shapely";
    license = lib.licenses.bsd3;
  };
}

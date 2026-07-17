{
  lib,
  fetchPypi,
  buildPythonPackage,
  poetry-core,
}:

buildPythonPackage rec {
  pname = "xmod";
  version = "1.8.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-OMdkhrnWcsVG1X2ANd8L639KmwiLw/st5UMa6CFEQ3c=";
  };

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "xmod" ];

  meta = {
    description = "Turn any object into a module";
    homepage = "https://github.com/rec/xmod";
    license = lib.licenses.mit;
  };
}

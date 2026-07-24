{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "hopcroftkarp";
  version = "1.2.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-KKeIfbga2ZXM02obUWSkxUKxbSeB6MSTNNydFBlowOc=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "hopcroftkarp" ];

  meta = {
    description = "Implementation of HopcroftKarp's algorithm";
    homepage = "https://github.com/sofiat-olaosebikan/hopcroftkarp";
    license = lib.licenses.gpl3Only;
  };
}

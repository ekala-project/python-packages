{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "bottle";
  version = "0.13.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-eH54Mn4SsieTjeAiSDM9eIz+RZh+3Kc1+PiOA0csP0c=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "bottle" ];

  meta = {
    homepage = "https://bottlepy.org/";
    description = "Fast and simple micro-framework for small web-applications";
    mainProgram = "bottle.py";
    license = lib.licenses.mit;
  };
}

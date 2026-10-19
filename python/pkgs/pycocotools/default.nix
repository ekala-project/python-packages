{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  cython,
  matplotlib,
}:

buildPythonPackage (finalAttrs: {
  pname = "pycocotools";
  version = "2.0.11";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-NCVNdtqFV2/K9cHzqpquFrjLFUGDNLpCg7gAeWvRmT0=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cython
    matplotlib
  ];

  pythonImportsCheck = [
    "pycocotools.coco"
    "pycocotools.cocoeval"
  ];

  # has no tests

  meta = {
    description = "Official APIs for the MS-COCO dataset";
    homepage = "https://github.com/cocodataset/cocoapi/tree/master/PythonAPI";
    license = lib.licenses.bsd2;
  };
})

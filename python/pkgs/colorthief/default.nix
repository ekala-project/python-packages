{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pillow,
}:

buildPythonPackage (finalAttrs: {
  pname = "colorthief";
  version = "0.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fengsp";
    repo = "color-thief-py";
    tag = finalAttrs.version;
    sha256 = "0lzpflal1iqbj4k7hayss5z024qf2sn8c3wxw03a0mgxg06ca2hm";
  };

  build-system = [ setuptools ];

  dependencies = [ pillow ];

  # no tests implemented

  pythonImportsCheck = [ "colorthief" ];

  meta = {
    description = "Python module for grabbing the color palette from an image";
    homepage = "https://github.com/fengsp/color-thief-py";
    license = lib.licenses.bsd3;
  };
})

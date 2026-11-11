{
  lib,
  buildPythonPackage,
  e3-core,
  fetchPypi,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "e3-testsuite";
  version = "27.2";
  pyproject = true;

  src = fetchPypi {
    pname = "e3_testsuite";
    inherit (finalAttrs) version;
    hash = "sha256-Vu43fIl2ZhmvtwPXPM3GIYojtgwv33zh/3tKNvlUw/Q=";
  };

  build-system = [ setuptools ];

  dependencies = [ e3-core ];

  pythonImportsCheck = [ "e3" ];

  meta = {
    description = "Generic testsuite framework in Python";
    homepage = "https://github.com/AdaCore/e3-testsuite/";
    license = lib.licenses.gpl3Only;
    platforms = lib.platforms.linux;
  };
})

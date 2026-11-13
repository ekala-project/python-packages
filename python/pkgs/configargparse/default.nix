{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "configargparse";
  version = "1.9.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-SNnCKv/krEGbTdBpH6kp11nh+ZV0vkGCZ4Xy2/PaY6U=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "configargparse" ];

  meta = {
    homepage = "https://github.com/bw2/ConfigArgParse";
    description = "Drop-in replacement for argparse";
    license = lib.licenses.mit;
  };
})

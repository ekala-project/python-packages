{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  trio,
}:

buildPythonPackage (finalAttrs: {
  pname = "siosocks";
  version = "0.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-uja79vWhPYOhhTUBIh+XpS4GnrYJy0/XpDXXQjnyHWM=";
  };

  build-system = [ setuptools ];

  dependencies = [ trio ];

  pythonImportsCheck = [ "siosocks" ];

  meta = {
    description = "Python socks 4/5 client/server library/framework";
    homepage = "https://github.com/pohmelie/siosocks";
    license = lib.licenses.mit;
  };
})

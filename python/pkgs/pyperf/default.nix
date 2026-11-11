{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  psutil,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyperf";
  version = "2.11.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-5TgTotl9xaiXYM9mDb0bahQlWPy20ys1KcimstA9vfg=";
  };

  build-system = [ setuptools ];

  dependencies = [ psutil ];

  pythonImportsCheck = [ "pyperf" ];

  meta = {
    description = "Python module to generate and modify perf";
    homepage = "https://pyperf.readthedocs.io/";
    license = lib.licenses.mit;
  };
})

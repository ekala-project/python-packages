{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  hatchling,

  # dependencies
  chardet,
  jinja2,
  pluggy,
  pygments,
}:

buildPythonPackage (finalAttrs: {
  pname = "diff_cover";
  version = "11.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-GP/zud9vKMYpU4WfsWMC0d7AGJ158+pDfAvK1cxg3PM=";
  };

  build-system = [ hatchling ];

  dependencies = [
    chardet
    jinja2
    pluggy
    pygments
  ];

  pythonImportsCheck = [ "diff_cover" ];

  meta = {
    description = "Automatically find diff lines that need test coverage";
    homepage = "https://github.com/Bachmann1234/diff-cover";
    license = lib.licenses.asl20;
  };
})

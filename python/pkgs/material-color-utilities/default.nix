{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  pillow,
  regex,
}:

buildPythonPackage (finalAttrs: {
  pname = "material-color-utilities-python";
  version = "0.1.5";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-PG8C585wWViFRHve83z3b9NijHyV+iGY2BdMJpyVH64=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "Pillow" ];

  dependencies = [
    pillow
    regex
  ];

  # No tests implemented.

  pythonImportsCheck = [ "material_color_utilities_python" ];

  meta = {
    homepage = "https://pypi.org/project/material_color_utilities_python";
    description = "Python port of material_color_utilities used for Material You colors";
    license = lib.licenses.asl20;
  };
})

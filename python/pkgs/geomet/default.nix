{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  click,
  setuptools,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "geomet";
  version = "1.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "geomet";
    repo = "geomet";
    tag = finalAttrs.version;
    hash = "sha256-YfI29925nffzRBMJb6Gm3muvlpwP3zSw2YJ2vWcf+Bo=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [
    click
    six
  ];

  pythonImportsCheck = [ "geomet" ];

  meta = {
    description = "Convert GeoJSON to WKT/WKB (Well-Known Text/Binary) and vice versa";
    mainProgram = "geomet";
    homepage = "https://github.com/geomet/geomet";
    license = lib.licenses.asl20;
  };
})

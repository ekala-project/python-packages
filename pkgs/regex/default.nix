{
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  setuptools,
}:

let
  version = "2026.4.4";
in
buildPythonPackage {
  pname = "regex";
  inherit version;
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mrabarnett";
    repo = "mrab-regex";
    tag = version;
    hash = "sha256-vLhukoQc50XOgv74hBQS36w+T+27y5GTTDetZ2JV8r4=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "regex" ];

  meta = {
    description = "Alternative regular expression module, to replace re";
    homepage = "https://github.com/mrabarnett/mrab-regex";
    license = [
      lib.licenses.asl20
      lib.licenses.cnri-python
    ];
  };
}

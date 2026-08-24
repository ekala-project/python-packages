{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "pick";
  version = "2.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "wong2";
    repo = "pick";
    tag = "v${finalAttrs.version}";
    hash = "sha256-/cvnDTRS3V9mk1T0zHAqdrDeRuOrnco9UF7luy687BM=";
  };

  build-system = [ poetry-core ];

  pythonImportsCheck = [ "pick" ];

  meta = {
    description = "Module to create curses-based interactive selection list in the terminal";
    homepage = "https://github.com/wong2/pick";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})

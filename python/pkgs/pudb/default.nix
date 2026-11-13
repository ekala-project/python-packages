{
  lib,
  buildPythonPackage,
  hatchling,
  fetchPypi,
  jedi,
  packaging,
  pygments,
  urwid,
  urwid-readline,
}:

buildPythonPackage (finalAttrs: {
  pname = "pudb";
  version = "2026.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-4yyO7KRwh2mVSBl/EBsf4ZWrgYe5DhcfCjjMCFL8pzw=";
  };

  build-system = [ hatchling ];

  dependencies = [
    jedi
    packaging
    pygments
    urwid
    urwid-readline
  ];

  meta = {
    description = "Full-screen, console-based Python debugger";
    mainProgram = "pudb";
    homepage = "https://github.com/inducer/pudb";
    license = lib.licenses.mit;
  };
})

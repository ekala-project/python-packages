{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build
  cython,
  setuptools-scm,
  setuptools_80,
  # propagates
  defcon,
  fonttools,
}:

let
  pname = "cu2qu";
  version = "1.6.7.post2";
in
buildPythonPackage (finalAttrs: {
  inherit (finalAttrs) pname version;
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-HfVi2ZvWBZImCI9ENwK/Uc/djMY2I/IxN0WaeNe/WAg=";
    extension = "zip";
  };

  nativeBuildInputs = [
    cython
    setuptools_80
    setuptools-scm
  ];

  dependencies = [
    defcon
    fonttools
  ]
  ++ fonttools.optional-dependencies.ufo;

  meta = {
    description = "Cubic-to-quadratic bezier curve conversion";
    mainProgram = "cu2qu";
    homepage = "https://github.com/googlefonts/cu2qu";
    license = lib.licenses.asl20;
  };
})

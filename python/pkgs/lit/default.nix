{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  python,
}:

buildPythonPackage (finalAttrs: {
  pname = "lit";
  version = "23.1.5";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-Uy+shS+w7XNZ/uY5eOqSEsK7FVQfCWZiWn08m+Wp34k=";
  };

  nativeBuildInputs = [ setuptools ];

  passthru = {
    inherit python;
  };

  # Non-standard test suite. Needs custom checkPhase.
  # Needs LLVM's `FileCheck` and `not`: `$out/bin/lit tests`
  # There should be `llvmPackages.lit` since older LLVM versions may
  # have the possibility of not correctly interfacing with newer lit versions

  meta = {
    description = "Portable tool for executing LLVM and Clang style test suites";
    mainProgram = "lit";
    homepage = "http://llvm.org/docs/CommandGuide/lit.html";
    license = lib.licenses.ncsa;
  };
})

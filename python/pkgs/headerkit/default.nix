{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "headerkit";
  version = "0.51.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-itME71Lf4jNqgNbgrQkkzIr1Nt5WKM2AzRcNwPSnv28=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [
    "headerkit"
    "headerkit.backends"
    "headerkit.writers.cython"
  ];

  meta = {
    description = "C/C++ header parser and FFI declaration generator";
    homepage = "https://github.com/axiomantic/headerkit";
    changelog = "https://github.com/axiomantic/headerkit/blob/main/CHANGELOG.md";
    license = with lib.licenses; [
      mit
      asl20
      llvm-exception
    ];
    mainProgram = "headerkit";
  };
})

{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pdm-backend,
  anyio,
  sniffio,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "asyncer";
  version = "0.0.18";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fastapi";
    repo = "asyncer";
    tag = finalAttrs.version;
    hash = "sha256-PoIyE+Mv+Uo74R6mXv2unKU396UW3/8085zvR1jYVvQ=";
  };

  build-system = [ pdm-backend ];

  dependencies = [
    anyio
    sniffio
    typing-extensions
  ];
  pythonImportsCheck = [ "asyncer" ];

  meta = {
    description = "Asyncer, async and await, focused on developer experience";
    homepage = "https://github.com/fastapi/asyncer";
    license = lib.licenses.mit;
  };
})

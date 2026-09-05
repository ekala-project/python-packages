{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pdm-backend,
}:

buildPythonPackage rec {
  pname = "annotated-doc";
  version = "0.0.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fastapi";
    repo = "annotated-doc";
    tag = version;
    hash = "sha256-Khgub17TKjp6GmLLyppFzcxFHcu/EBTCrnabu3Km2Yo=";
  };

  build-system = [ pdm-backend ];

  pythonImportsCheck = [ "annotated_doc" ];

  meta = {
    description = "Document parameters, class attributes, return types, and variables inline, with Annotated";
    homepage = "https://github.com/fastapi/annotated-doc";
    license = lib.licenses.mit;
  };
}

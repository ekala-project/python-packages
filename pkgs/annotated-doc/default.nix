{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pdm-backend,
}:

buildPythonPackage rec {
  pname = "annotated-doc";
  version = "0.0.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fastapi";
    repo = "annotated-doc";
    tag = version;
    hash = "sha256-O7kobzzFfHelYsxTflifEcoEWsUmPzlDz3siFTAq0I0=";
  };

  build-system = [ pdm-backend ];

  pythonImportsCheck = [ "annotated_doc" ];

  meta = {
    description = "Document parameters, class attributes, return types, and variables inline, with Annotated";
    homepage = "https://github.com/fastapi/annotated-doc";
    license = lib.licenses.mit;
  };
}

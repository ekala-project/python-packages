{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  chardet,
  click,
  flex,
  packaging,
  pyicu,
  requests,
  ruamel-yaml,
  setuptools-scm,
  six,
  swagger-spec-validator,
  openapi-spec-validator,
}:

buildPythonPackage rec {
  pname = "prance";
  version = "26.07.19.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "RonnyPfannschmidt";
    repo = "prance";
    tag = "v${version}";
    fetchSubmodules = true;
    hash = "sha256-kUPGSG8ZLJlke0X/Vj3s6USNGIW3xtF8/N2ZUZ7KKoI=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [
    chardet
    packaging
    requests
    ruamel-yaml
    six
  ];

  optional-dependencies = {
    cli = [ click ];
    flex = [ flex ];
    icu = [ pyicu ];
    osv = [ openapi-spec-validator ];
    ssv = [ swagger-spec-validator ];
  };
  pythonImportsCheck = [ "prance" ];

  meta = {
    description = "Resolving Swagger/OpenAPI 2.0 and 3.0.0 Parser";
    homepage = "https://github.com/RonnyPfannschmidt/prance";
    license = lib.licenses.mit;
    mainProgram = "prance";
  };
}

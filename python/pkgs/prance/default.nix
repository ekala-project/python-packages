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
  version = "25.04.08.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "RonnyPfannschmidt";
    repo = "prance";
    tag = "v${version}";
    fetchSubmodules = true;
    hash = "sha256-71M9ufxb0aaSgokThlsTS4ElOJLZntF2TYIErPccQbU=";
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
    maintainers = [ ];
    mainProgram = "prance";
  };
}

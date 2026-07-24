{
  lib,
  buildPythonPackage,
  ddt,
  fetchFromGitHub,
  importlib-metadata,
  jsonschema,
  license-expression,
  lxml,
  packageurl-python,
  py-serializable,
  poetry-core,
  requirements-parser,
  sortedcontainers,
  setuptools,
  toml,
  types-setuptools,
  types-toml,
  xmldiff,
}:

buildPythonPackage (finalAttrs: {
  pname = "cyclonedx-python-lib";
  version = "11.11.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "CycloneDX";
    repo = "cyclonedx-python-lib";
    tag = "v${finalAttrs.version}";
    hash = "sha256-P6TJHxETBazn+zfrDYUuzCH2DHhYVtn1ceBharxCXRo=";
  };

  pythonRelaxDeps = [ "py-serializable" ];

  build-system = [ poetry-core ];

  dependencies = [
    importlib-metadata
    license-expression
    packageurl-python
    requirements-parser
    setuptools
    sortedcontainers
    toml
    py-serializable
    types-setuptools
    types-toml
  ];

  optional-dependencies = {
    validation = [
      jsonschema
      lxml
    ];
    json-validation = [ jsonschema ];
    xml-validation = [ lxml ];
  };
  meta = {
    description = "Python library for generating CycloneDX SBOMs";
    homepage = "https://github.com/CycloneDX/cyclonedx-python-lib";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})

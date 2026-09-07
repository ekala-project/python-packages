{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  requests,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "guntamatic";
  version = "1.12.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "JensTimmerman";
    repo = "guntamatic";
    tag = "v${finalAttrs.version}";
    hash = "sha256-fpWnlu6t09gfKWw+uYahyKJt6wbXNDN5ILaB2oWum5o=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "guntamatic" ];

  meta = {
    description = "Module to get data from a Guntamatic heater e.g. BMK 20";
    homepage = "https://github.com/JensTimmerman/guntamatic";
    license = lib.licenses.gpl3Only;
    maintainers = [ ];
  };
})

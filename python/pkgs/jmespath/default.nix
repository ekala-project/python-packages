{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "jmespath";
  version = "1.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jmespath";
    repo = "jmespath.py";
    tag = finalAttrs.version;
    hash = "sha256-DtRMWKE1LeD+NAmMJOISfBo5w9HJW7XFeQp7A3NjkjE=";
  };

  build-system = [ setuptools ];

  meta = {
    homepage = "https://github.com/jmespath/jmespath.py";
    description = "JMESPath allows you to declaratively specify how to extract elements from a JSON document";
    mainProgram = "jp.py";
    license = lib.licenses.mit;
  };
})

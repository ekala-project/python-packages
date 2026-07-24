{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  packaging,
  pyparsing,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "pip-requirements-parser";
  version = "32.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "nexB";
    repo = "pip-requirements-parser";
    tag = "v${finalAttrs.version}";
    hash = "sha256-UMrwDXxk+sD3P2jk7s95y4OX6DRBjWWZZ8IhkR6tnZ4=";
  };

  patches = [
    # packaging 26.0 changed the string representation of requirements with
    # URLs to contain an extra space before the `@`.
    # https://github.com/pypa/packaging/pull/953
    # https://github.com/aboutcode-org/pip-requirements-parser/issues/27
    # https://github.com/aboutcode-org/pip-requirements-parser/pull/28
    ./packaging-26.patch
  ];

  dontConfigure = true;

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    packaging
    pyparsing
  ];
  pythonImportsCheck = [ "pip_requirements_parser" ];
  meta = {
    description = "Module to parse pip requirements";
    homepage = "https://github.com/nexB/pip-requirements-parser";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})

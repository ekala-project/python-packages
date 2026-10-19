{
  lib,
  buildPythonPackage,
  colorama,
  fetchPypi,
  jinja2,
  pytestCheckHook,
  pyyaml,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "mergedb";
  version = "0.1.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "2034c18dca23456c5b166b63d94300bcd8ec9f386e6cd639c2f66e141c0313f9";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ setuptools-scm ];

  dependencies = [
    pyyaml
    colorama
    jinja2
    setuptools
  ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "mergedb" ];

  meta = {
    description = "Tool/library for deep merging YAML files";
    mainProgram = "mergedb";
    homepage = "https://github.com/graysonhead/mergedb";
    license = lib.licenses.gpl3Only;
  };
})

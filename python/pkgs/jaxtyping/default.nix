{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,

  # dependencies
  wadler-lindig,
}:

buildPythonPackage (finalAttrs: {
  pname = "jaxtyping";
  version = "0.3.11";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "patrick-kidger";
    repo = "jaxtyping";
    tag = "v${finalAttrs.version}";
    hash = "sha256-oC8n4YiV39EjRm8vYDFrUVJmEPeH814q7uIKdmpqnJk=";
  };

  build-system = [ hatchling ];

  dependencies = [
    wadler-lindig
  ];

  pythonImportsCheck = [ "jaxtyping" ];

  doCheck = false;

  meta = {
    description = "Type annotations and runtime checking for JAX arrays and PyTrees";
    homepage = "https://github.com/patrick-kidger/jaxtyping";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})

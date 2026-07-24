{
  lib,
  beartype,
  buildPythonPackage,
  click,
  fetchFromGitHub,
  license-expression,
  ply,
  pyyaml,
  rdflib,
  semantic-version,
  setuptools,
  setuptools-scm,
  uritools,
  xmltodict,
}:

buildPythonPackage (finalAttrs: {
  pname = "spdx-tools";
  version = "0.8.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "spdx";
    repo = "tools-python";
    tag = "v${finalAttrs.version}";
    hash = "sha256-dHR5Lx8KDmfQLS4I+6oO5kucEUXsFhAaHSPpxJbxlu4=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    beartype
    click
    license-expression
    ply
    pyyaml
    rdflib
    semantic-version
    uritools
    xmltodict
  ];
  pythonImportsCheck = [ "spdx_tools.spdx" ];
  meta = {
    description = "SPDX parser and tools";
    homepage = "https://github.com/spdx/tools-python";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})

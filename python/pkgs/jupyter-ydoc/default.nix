{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  hatch-nodejs-version,
  hatchling,
  # dependencies
  anyio,
  pycrdt,
}:

buildPythonPackage (finalAttrs: {
  pname = "jupyter-ydoc";
  version = "3.4.1";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "jupyter-server";
    repo = "jupyter_ydoc";
    tag = "v${finalAttrs.version}";
    hash = "sha256-HlYSPlYiHyVwJhsRY10SgotKa9ejlj0hlxbS+chtaBI=";
  };

  build-system = [
    hatch-nodejs-version
    hatchling
  ];

  pythonRelaxDeps = [
    "pycrdt"
  ];
  dependencies = [
    anyio
    pycrdt
  ];

  pythonImportsCheck = [ "jupyter_ydoc" ];

  # requires a Node.js environment

  meta = {
    description = "Document structures for collaborative editing using Yjs/pycrdt";
    homepage = "https://github.com/jupyter-server/jupyter_ydoc";
    license = lib.licenses.bsd3;
    teams = [ lib.teams.jupyter ];
  };
})

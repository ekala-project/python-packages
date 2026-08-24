{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  setuptools-scm
, # dependencies
  black
, docstring-to-markdown
, jedi
, pluggy
, python-lsp-jsonrpc
, setuptools
, ujson
, # optional-dependencies
  autopep8
, flake8
, mccabe
, pycodestyle
, pydocstyle
, pyflakes
, pylint
, rope
, toml
, whatthepatch
, yapf
, websockets
,
}:

buildPythonPackage rec {
  pname = "python-lsp-server";
  version = "1.14.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-lsp";
    repo = "python-lsp-server";
    tag = "v${version}";
    hash = "sha256-Yq5dYaX+/hLvmPpHI8rhCcSlabQBPAyUrIQRgnoi17c=";
  };

  patches = [
    # https://github.com/python-lsp/python-lsp-server/pull/709
    ./jedi-compat.patch
  ];

  pythonRelaxDeps = [
    "autopep8"
  ];

  build-system = [ setuptools-scm ];

  dependencies = [
    black
    docstring-to-markdown
    jedi
    pluggy
    python-lsp-jsonrpc
    setuptools # `pkg_resources`imported in pylsp/config/config.py
    ujson
  ];

  optional-dependencies = {
    all = [
      autopep8
      flake8
      mccabe
      pycodestyle
      pydocstyle
      pyflakes
      pylint
      rope
      toml
      websockets
      whatthepatch
      yapf
    ];
    autopep8 = [ autopep8 ];
    flake8 = [ flake8 ];
    mccabe = [ mccabe ];
    pycodestyle = [ pycodestyle ];
    pydocstyle = [ pydocstyle ];
    pyflakes = [ pyflakes ];
    pylint = [ pylint ];
    rope = [ rope ];
    yapf = [
      whatthepatch
      yapf
    ];
    websockets = [ websockets ];
  };

  pythonImportsCheck = [
    "pylsp"
  ];

  meta = {
    description = "Python implementation of the Language Server Protocol";
    homepage = "https://github.com/python-lsp/python-lsp-server";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "pylsp";
  };
}

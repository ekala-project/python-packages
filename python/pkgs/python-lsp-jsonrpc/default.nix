{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytest-cov-stub,
  setuptools,
  setuptools-scm,
  ujson,
}:

buildPythonPackage rec {
  pname = "python-lsp-jsonrpc";
  version = "1.1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "python-lsp";
    repo = "python-lsp-jsonrpc";
    tag = "v${version}";
    hash = "sha256-5WN/31e6WCgXVzevMuQbNjyo/2jjWDF+m48nrLKS+64=";
  };

  nativeBuildInputs = [
    setuptools
    setuptools-scm
  ];

  propagatedBuildInputs = [ ujson ];
  pythonImportsCheck = [ "pylsp_jsonrpc" ];

  meta = {
    description = "Python server implementation of the JSON RPC 2.0 protocol";
    homepage = "https://github.com/python-lsp/python-lsp-jsonrpc";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  setuptools
, # optional-dependencies
  pygments
, wavedrom
, latex2mathml
,
}:

buildPythonPackage rec {
  pname = "markdown2";
  version = "2.5.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "trentm";
    repo = "python-markdown2";
    tag = version;
    hash = "sha256-h0vzv59RsceTZSvFF9DX5D6YanAKMTG3cNc1napXMyI=";
  };

  build-system = [ setuptools ];

  optional-dependencies = {
    code_syntax_highlighting = [ pygments ];
    wavedrom = [ wavedrom ];
    latex = [ latex2mathml ];
  };

  pythonImportsCheck = [ "markdown2" ];

  meta = {
    description = "Fast and complete Python implementation of Markdown";
    mainProgram = "markdown2";
    homepage = "https://github.com/trentm/python-markdown2";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

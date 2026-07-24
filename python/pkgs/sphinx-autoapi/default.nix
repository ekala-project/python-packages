{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  flit-core,

  # dependencies
  astroid,
  jinja2,
  pyyaml,
  sphinx,

  # tests
  beautifulsoup4,
}:

buildPythonPackage rec {
  pname = "sphinx-autoapi";
  version = "3.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "readthedocs";
    repo = "sphinx-autoapi";
    tag = "v${version}";
    hash = "sha256-pEfyVwvAqIg/1F5kX7WLlhdD+5tq3422u8N6nBizRcA=";
  };

  build-system = [ flit-core ];

  dependencies = [
    astroid
    jinja2
    pyyaml
    sphinx
  ];
  pythonImportsCheck = [ "autoapi" ];

  meta = {
    homepage = "https://github.com/readthedocs/sphinx-autoapi";
    description = "Provides 'autodoc' style documentation";
    longDescription = ''
      Sphinx AutoAPI provides 'autodoc' style documentation for
      multiple programming languages without needing to load, run, or
      import the project being documented.
    '';
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

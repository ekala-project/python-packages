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
  version = "3.8.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "readthedocs";
    repo = "sphinx-autoapi";
    tag = "v${version}";
    hash = "sha256-WvatLBJGTqQJbRV9wnac7oBRX+Az3mEHLkbCqNFQIYk=";
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
  };
}

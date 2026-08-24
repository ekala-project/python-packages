{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  flit-core,
  # dependencies
  docutils,
  mistune,
  pygments,
  sphinx,
}:

buildPythonPackage rec {
  pname = "sphinx-mdinclude";
  version = "0.6.2";
  pyproject = true;

  src = fetchPypi {
    pname = "sphinx_mdinclude";
    inherit version;
    hash = "sha256-RHRi6Cy4vmFASiIEIn+SB2nrkj0vV2COMyXzu4goa0w=";
  };

  nativeBuildInputs = [ flit-core ];

  propagatedBuildInputs = [
    docutils
    mistune
    pygments
    sphinx
  ];

  meta = {
    homepage = "https://github.com/omnilib/sphinx-mdinclude";
    description = "Sphinx extension for including or writing pages in Markdown format";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "click";
  version = "8.5.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pallets";
    repo = "click";
    tag = finalAttrs.version;
    hash = "sha256-dG59ZMxp+jV0CT10mZaX4p8lWR7WmIn5WyrBkEnIj4I=";
  };

  build-system = [ flit-core ];
  meta = {
    homepage = "https://click.palletsprojects.com/";
    description = "Create beautiful command line interfaces in Python";
    longDescription = ''
      A Python package for creating beautiful command line interfaces in a
      composable way, with as little code as necessary.
    '';
    license = lib.licenses.bsd3;
  };
})

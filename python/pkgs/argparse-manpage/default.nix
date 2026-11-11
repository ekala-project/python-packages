{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "argparse-manpage";
  version = "4.8";
  pyproject = true;

  src = fetchPypi {
    pname = "argparse_manpage";
    inherit (finalAttrs) version;
    hash = "sha256-1VzhwkZHnd2ChxFwqMxUOmgxu2jIeimOR/BmOpMwt08=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "build_manpages" ];

  meta = {
    description = "Automatically build man-pages for your Python project";
    homepage = "https://github.com/praiskup/argparse-manpage";
    license = lib.licenses.asl20;
  };
})

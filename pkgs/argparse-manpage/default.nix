{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "argparse-manpage";
  version = "4.7";
  pyproject = true;

  src = fetchPypi {
    pname = "argparse_manpage";
    inherit version;
    hash = "sha256-Heq3ayEqyHU8u2e50tK8CUm7wzi7HMNUfwiQyzQQizI=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "build_manpages" ];

  meta = {
    description = "Automatically build man-pages for your Python project";
    homepage = "https://github.com/praiskup/argparse-manpage";
    license = lib.licenses.asl20;
  };
}

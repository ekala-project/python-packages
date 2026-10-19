{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  click,
}:

buildPythonPackage (finalAttrs: {
  pname = "spark-parser";
  version = "1.9.0";
  pyproject = true;

  src = fetchPypi {
    pname = "spark_parser";
    inherit (finalAttrs) version;
    sha256 = "sha256-3GbUjEJlxBM9tBqcX+nBxQKzsgFn3xWKDyNM0xcSz2Q=";
  };

  build-system = [ setuptools ];

  dependencies = [ click ];

  unittestFlagsArray = [
    "-s"
  ];

  meta = {
    description = "Early-Algorithm Context-free grammar Parser";
    mainProgram = "spark-parser-coverage";
    homepage = "https://github.com/rocky/python-spark";
    license = lib.licenses.mit;
  };
})

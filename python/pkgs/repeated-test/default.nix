{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "repeated-test";
  version = "2.3.3";
  pyproject = true;

  src = fetchPypi {
    pname = "repeated_test";
    inherit version;
    hash = "sha256-3YPU8SL9rud5s0pnwwH5TJk1MXsDhdkDnZp/Oj6sgXs=";
  };

  nativeBuildInputs = [ setuptools-scm ];
  pythonImportsCheck = [ "repeated_test" ];

  meta = {
    description = "Unittest-compatible framework for repeating a test function over many fixtures";
    homepage = "https://github.com/epsy/repeated_test";
    license = lib.licenses.mit;
  };
}

{
  lib,
  buildPythonPackage,
  fetchPypi,
  python,
  setuptools,
  cffi,
}:

buildPythonPackage rec {
  pname = "pymunk";
  version = "7.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-8wRYlyYTJbs+iShEAt1DuQjQpYcdwgEFl+NrQwnwIps=";
  };

  nativeBuildInputs = [ cffi ];

  build-system = [ setuptools ];

  dependencies = [ cffi ];

  preBuild = ''
    ${python.pythonOnBuildForHost.interpreter} setup.py build_ext --inplace
  '';

  pythonImportsCheck = [ "pymunk" ];

  meta = {
    description = "2d physics library";
    homepage = "https://www.pymunk.org";
    license = lib.licenses.mit;
    maintainers = [ ];
    platforms = lib.platforms.unix;
  };
}

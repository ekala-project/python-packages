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
  version = "7.3.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Ed50/c5o9HUUwubljvVQKgu2i6HDx35ONZuqRm6dTBY=";
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
    platforms = lib.platforms.unix;
  };
}

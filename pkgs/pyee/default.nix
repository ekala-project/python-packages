{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  typing-extensions,
  wheel,
}:

buildPythonPackage rec {
  pname = "pyee";
  version = "13.0.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-s5HjxaQ00fURiiVhUAHbyPZpz0EKtn0ExNTgfFVIHDc=";
  };

  postPatch = ''
    # specifies a string for addopts, but must be a list since pytest9
    sed -i '/addopts/d' pyproject.toml
  '';

  nativeBuildInputs = [
    setuptools
    setuptools-scm
    wheel
  ];

  propagatedBuildInputs = [ typing-extensions ];

  pythonImportsCheck = [ "pyee" ];

  meta = {
    description = "Port of Node.js's EventEmitter to Python";
    homepage = "https://github.com/jfhbrook/pyee";
    license = lib.licenses.mit;
  };
}

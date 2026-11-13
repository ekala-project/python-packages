{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  typing-extensions,
  wheel,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyee";
  version = "16.0.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-vcbpIUQprl7BC4pRYEz2jDY7EcvBBePaciBPzowRHlk=";
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

  dependencies = [ typing-extensions ];

  pythonImportsCheck = [ "pyee" ];

  meta = {
    description = "Port of Node.js's EventEmitter to Python";
    homepage = "https://github.com/jfhbrook/pyee";
    license = lib.licenses.mit;
  };
})

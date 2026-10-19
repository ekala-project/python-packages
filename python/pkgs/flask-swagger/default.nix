{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  flask,
  pyyaml,
}:

buildPythonPackage (finalAttrs: {
  version = "0.2.14";
  pyproject = true;
  pname = "flask-swagger";

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "b4085f5bc36df4c20b6548cd1413adc9cf35719b0f0695367cd542065145294d";
  };

  build-system = [ setuptools ];

  # No Tests

  dependencies = [
    flask
    pyyaml
  ];

  meta = {
    homepage = "https://github.com/gangverk/flask-swagger";
    license = lib.licenses.mit;
    description = "Extract swagger specs from your flask project";
    mainProgram = "flaskswagger";
  };
})

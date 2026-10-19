{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  setuptools-scm,
}:

buildPythonPackage (finalAttrs: {
  pname = "py";
  version = "1.11.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    sha256 = "51c75c4126074b472f746a24399ad32f6053d1b34b68d2fa41e558e6f4a98719";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ setuptools-scm ];

  pythonImportsCheck = [ "py" ];

  meta = {
    description = "Library with cross-python path, ini-parsing, io, code, log facilities";
    homepage = "https://py.readthedocs.io/";
    license = lib.licenses.mit;
  };
})

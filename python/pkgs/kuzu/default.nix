{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools-scm,
  cmake,
}:

buildPythonPackage (finalAttrs: {
  pname = "kuzu";
  version = "0.11.3";

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-576jyjDEu0Ynku7cqn8hJcgAskO7SocuHu3BaRfBlno=";
  };

  pyproject = true;

  nativeBuildInputs = [
    setuptools-scm
    cmake
  ];

  dontUseCmakeConfigure = true;

  pythonImportsCheck = [ "kuzu" ];

  meta = {
    description = "Python bindings for Kuzu, an embeddable property graph database management system";
    homepage = "https://kuzudb.com/";
    license = lib.licenses.mit;
  };
})

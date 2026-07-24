{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  regex,
}:

buildPythonPackage rec {
  pname = "parsimonious";
  version = "0.11.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-4IA3fZiVe+7AU1gNOK5U/N98Rw+3hnC6S/i1+dXK0qk=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  postPatch = ''
    substituteInPlace pyproject.toml --replace-fail "regex>=2022.3.15" "regex"
  '';

  dependencies = [ regex ];

  pythonImportsCheck = [ "parsimonious" ];

  meta = {
    description = "Arbitrary-lookahead parser";
    homepage = "https://github.com/erikrose/parsimonious";
    license = lib.licenses.mit;
  };
}

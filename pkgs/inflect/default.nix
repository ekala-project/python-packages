{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  more-itertools,
  typeguard,
}:

buildPythonPackage rec {
  pname = "inflect";
  version = "7.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-+vGYAcN0LtWgWozjiODY/hoH+NCVyCIB65BPXSetVx8=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    more-itertools
    typeguard
  ];

  pythonImportsCheck = [ "inflect" ];

  meta = {
    homepage = "https://github.com/jaraco/inflect";
    description = "Correctly generate plurals, singular nouns, ordinals, indefinite articles";
    license = lib.licenses.mit;
  };
}

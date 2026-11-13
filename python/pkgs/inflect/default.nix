{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
  setuptools-scm,

  # dependencies
  jaraco-functools,
  more-itertools,
  typeguard,
}:

buildPythonPackage (finalAttrs: {
  pname = "inflect";
  version = "7.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-tGh1tQU0p81fz7WnyXG7k/5olIxDylPpgzvR4aaSIb0=";
  };

  # coherent.licensed is only used to infer license metadata, which is already declared
  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"coherent.licensed",' ""
  '';

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    jaraco-functools
    more-itertools
    typeguard
  ];

  pythonImportsCheck = [ "inflect" ];

  meta = {
    homepage = "https://github.com/jaraco/inflect";
    description = "Correctly generate plurals, singular nouns, ordinals, indefinite articles";
    license = lib.licenses.mit;
  };
})

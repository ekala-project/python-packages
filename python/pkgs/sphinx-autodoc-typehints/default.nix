{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatch-vcs,
  hatchling,
  sphinx,
}:

buildPythonPackage (finalAttrs: {
  pname = "sphinx-autodoc-typehints";
  version = "3.13.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tox-dev";
    repo = "sphinx-autodoc-typehints";
    tag = finalAttrs.version;
    hash = "sha256-zUtQfEoKgPEKw/1vHpg9GsfTWs0UU6X8oma0+doIhNI=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  dependencies = [ sphinx ];
  # requires spobjinv, nbtyping
  doCheck = false;

  pythonImportsCheck = [ "sphinx_autodoc_typehints" ];

  meta = {
    description = "Type hints (PEP 484) support for the Sphinx autodoc extension";
    homepage = "https://github.com/tox-dev/sphinx-autodoc-typehints";
    license = lib.licenses.mit;
  };
})

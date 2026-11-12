{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  sphinx,
  pyenchant,
  hatchling,
  hatch-vcs,
  wheel,
}:

buildPythonPackage (finalAttrs: {
  pname = "sphinxcontrib-spelling";
  version = "8.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sphinx-contrib";
    repo = "spelling";
    tag = finalAttrs.version;
    hash = "sha256-1y9a9AqYyPnLQVc23mD/Hs2EieZmsFOfLES8Jd/ulRQ=";
  };

  nativeBuildInputs = [
    hatchling
    hatch-vcs
    wheel
  ];

  dependencies = [
    sphinx
    pyenchant
  ];

  # No tests included
  pythonImportsCheck = [ "sphinxcontrib.spelling" ];

  pythonNamespaces = [ "sphinxcontrib" ];

  meta = {
    description = "Sphinx spelling extension";
    homepage = "https://github.com/sphinx-contrib/spelling";
    license = lib.licenses.bsd2;
  };
})

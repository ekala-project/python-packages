{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  setuptools-scm,
  jinja2,
  packaging,
  ply,
}:

buildPythonPackage rec {
  pname = "stone";
  version = "3.5.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-0NmfFNFURS5xs+J1Lv27sXaeT+y8EpGx39GgRve2ocs=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    jinja2
    packaging
    ply
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools-scm>=8,<9" "setuptools-scm>=8"
  '';

  pythonImportsCheck = [ "stone" ];

  meta = {
    homepage = "https://github.com/dropbox/stone";
    description = "Official API Spec Language for Dropbox API V2";
    license = lib.licenses.mit;
  };
}

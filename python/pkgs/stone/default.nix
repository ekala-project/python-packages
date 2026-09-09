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
  version = "3.5.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-T09DmeanZGkXcW19wG+BTTL5TzD7UdYbXHYOj207pTs=";
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
      --replace-fail "setuptools>=83.0.0" setuptools \
      --replace-fail "setuptools-scm>=10.2.1,<11" setuptools-scm
  '';

  pythonImportsCheck = [ "stone" ];

  meta = {
    homepage = "https://github.com/dropbox/stone";
    description = "Official API Spec Language for Dropbox API V2";
    license = lib.licenses.mit;
  };
}

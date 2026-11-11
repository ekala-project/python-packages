{
  lib,
  buildPythonPackage,
  fetchPypi,
  dulwich,
  pbr,
  sphinx,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "openstackdocstheme";
  version = "3.6.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-U6+ltUGULIsyA0cD8gY5aR1FBI2meSb9vvUl3zV84NA=";
  };

  postPatch = ''
    patchShebangs bin/
  '';

  build-system = [ setuptools ];

  dependencies = [
    dulwich
    pbr
    setuptools
    sphinx
  ];

  # no tests

  # Import check disabled: pbr.packaging imports distutils which was removed
  # in Python 3.13. Works fine at build time via setuptools.
  pythonImportsCheck = [ ];

  meta = {
    description = "Sphinx theme for RST-sourced documentation published to docs.openstack.org";
    homepage = "https://github.com/openstack/openstackdocstheme";
    license = lib.licenses.asl20;
  };
})

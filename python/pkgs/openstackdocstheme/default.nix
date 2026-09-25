{
  lib,
  buildPythonPackage,
  fetchPypi,
  dulwich,
  pbr,
  sphinx,
  setuptools,
}:

buildPythonPackage rec {
  pname = "openstackdocstheme";
  version = "3.5.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-3h1dXtIMk1/CgbUP30ppUo+Q8qdb7PQtGIRD9eGWwJ8=";
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
}

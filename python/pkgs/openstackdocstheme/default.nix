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

    # pbr.packaging does `from distutils import log`; importing setuptools first
    # installs its distutils shim (distutils was removed in Python 3.12)
    substituteInPlace openstackdocstheme/ext.py \
      --replace-fail "import dulwich.repo" "import dulwich.repo; import setuptools"
  '';

  build-system = [ setuptools ];

  dependencies = [
    dulwich
    pbr
    setuptools
    sphinx
  ];

  # no tests

  pythonImportsCheck = [ "openstackdocstheme" ];

  meta = {
    description = "Sphinx theme for RST-sourced documentation published to docs.openstack.org";
    homepage = "https://github.com/openstack/openstackdocstheme";
    license = lib.licenses.asl20;
  };
})

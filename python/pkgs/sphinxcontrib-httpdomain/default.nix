{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  uv-build,
  sphinx,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "sphinxcontrib-httpdomain";
  version = "2.2.1";
  pyproject = true;

  src = fetchPypi {
    pname = "sphinxcontrib_httpdomain";
    inherit (finalAttrs) version;
    hash = "sha256-onEMmCR2l0KIy0EESs8mM0RoqoXnMBXoehKUxi2T8RQ=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"uv_build >= 0.12.22, < 0.14.0"' '"uv_build"'
  '';

  build-system = [ uv-build ];

  dependencies = [
    six
    sphinx
  ];

  pythonNamespaces = [ "sphinxcontrib" ];

  pythonImportsCheck = [ "sphinxcontrib.httpdomain" ];

  meta = {
    description = "Provides a Sphinx domain for describing RESTful HTTP APIs";
    homepage = "https://github.com/sphinx-contrib/httpdomain";
    changelog = "https://sphinxcontrib-httpdomain.readthedocs.io/en/stable/#changelog";
    license = lib.licenses.bsd2;
  };
})

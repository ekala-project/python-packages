{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "httptools";
  version = "0.9.0";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-1ITrt+Oj81l7D2RfvRuFYzZ0yoCMH1uhHCyvfGb1yLY=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools>=80.9.0,<=82.0.1" "setuptools"
  '';

  build-system = [ setuptools ];

  # Tests are not included in pypi tarball

  pythonImportsCheck = [ "httptools" ];

  meta = {
    description = "Collection of framework independent HTTP protocol utils";
    homepage = "https://github.com/MagicStack/httptools";
    license = lib.licenses.mit;
  };
})

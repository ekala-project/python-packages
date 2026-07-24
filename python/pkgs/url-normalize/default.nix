{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  idna,
}:

buildPythonPackage rec {
  pname = "url-normalize";
  version = "3.0.0";
  pyproject = true;

  src = fetchPypi {
    pname = "url_normalize";
    inherit version;
    hash = "sha256-BVLL8oMaMqKJlKE9KbylimDhD/bAOA40PsbRwqDSMtg=";
  };

  build-system = [ setuptools ];

  dependencies = [ idna ];

  pythonImportsCheck = [ "url_normalize" ];

  meta = {
    description = "URL normalization for Python";
    homepage = "https://github.com/niksite/url-normalize";
    license = lib.licenses.mit;
  };
}

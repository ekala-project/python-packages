{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
}:

buildPythonPackage rec {
  pname = "urlman";
  version = "2.0.3";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-QP4bGBkUph8FR+ZoYjW2D9dPMlOWvK8c3QtjJg4phK4=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools ~= 76.0" "setuptools"
  '';

  build-system = [ setuptools ];

  pythonImportsCheck = [ "urlman" ];

  meta = {
    description = "Django URL pattern helpers";
    homepage = "https://github.com/andrewgodwin/urlman";
    license = lib.licenses.asl20;
  };
}

{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  versioneer,
}:

buildPythonPackage rec {
  pname = "click-spinner";
  version = "0.1.10";
  pyproject = true;

  src = fetchPypi {
    pname = "click-spinner";
    inherit version;
    hash = "sha256-h+rPnXKYlzol12Fe9X1Hgq6/kTpTK7pLKKN+Nm6XXa8=";
  };

  build-system = [
    setuptools
    versioneer
  ];

  postPatch = ''
    rm versioneer.py
  '';

  pythonImportsCheck = [ "click_spinner" ];

  meta = {
    description = "Add support for showing that command line app is active to Click";
    homepage = "https://github.com/click-contrib/click-spinner";
    license = lib.licenses.mit;
  };
}

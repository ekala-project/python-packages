{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "netifaces-plus";
  version = "0.12.5";
  pyproject = true;

  src = fetchPypi {
    pname = "netifaces_plus";
    inherit version;
    hash = "sha256-ZCi9fUMjVW79Sw7GsxUiGHWBL4zytpUBxv2noJ63lSg=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "netifaces" ];

  meta = {
    description = "Portable network interface information";
    homepage = "https://github.com/tsukumijima/netifaces-plus";
    license = lib.licenses.mit;
  };
}

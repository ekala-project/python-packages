{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  pbr,
  linecache2,
  six,
}:

buildPythonPackage rec {
  pname = "traceback2";
  version = "1.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-BazGegmYDC7P7dNCP3rgEEg57MtV/GRXc+HKoJUcMDA=";
  };

  build-system = [
    setuptools
    pbr
  ];

  dependencies = [
    linecache2
    six
  ];

  pythonImportsCheck = [ "traceback2" ];

  meta = {
    homepage = "https://pypi.org/project/traceback2/";
    description = "Backport of traceback to older supported Pythons";
    license = lib.licenses.psfl;
  };
}

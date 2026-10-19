{
  lib,
  buildPythonPackage,
  fetchPypi,
  # build-system
  setuptools,
  pytest,
}:

buildPythonPackage rec {
  pname = "ephem";
  version = "4.2.1";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-kgyzA2nHn94QiMIGDVVepfilD9yAqSZYMv1b8ZXPFH8=";
  };

  build-system = [ setuptools ];
  # JPLTest uses assets not distributed in package
  checkPhase = ''
    pytest --pyargs ephem.tests -k "not JPLTest"
  '';

  pythonImportsCheck = [ "ephem" ];

  meta = {
    description = "Compute positions of the planets and stars";
    homepage = "https://github.com/brandon-rhodes/pyephem";
    license = lib.licenses.mit;
  };
}

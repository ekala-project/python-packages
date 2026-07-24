{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "getkey";
  version = "0.6.5";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-aMfHAsOzTerPQn9sDx/WbFwqoS14AaoyRC/BpxyM4Fk=";
  };

  postPatch = ''
    sed -e '/python-coveralls/d' -e '/pytest-cov/d' -e '/flake8/d' -i setup.py
    rm setup.cfg
  '';

  build-system = [ setuptools ];

  pythonImportsCheck = [ "getkey" ];

  meta = {
    description = "Read single characters and key-strokes";
    homepage = "https://github.com/kcsaff/getkey";
    license = lib.licenses.mit;
  };
}

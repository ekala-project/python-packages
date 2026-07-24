{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
}:

buildPythonPackage rec {
  pname = "sexpdata";
  version = "1.0.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-krZ7A2H2dm+PnkS5UZzz+8+vp1Xbhbv4k8Phz03awQk=";
  };

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "sexpdata" ];

  meta = {
    description = "S-expression parser for Python";
    homepage = "https://github.com/jd-boyd/sexpdata";
    license = lib.licenses.bsd2;
  };
}

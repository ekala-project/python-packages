{ lib
, buildPythonPackage
, fetchPypi
, setuptools
, swig
,
}:

buildPythonPackage rec {
  pname = "pykcs11";
  version = "1.5.18";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Ev2HizaYIdgMG+ihQMheig+xNY/Kq6ZspmhpITaS8ic=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ swig ];

  pypaBuildFlags = [ "--skip-dependency-check" ];

  outputs = [
    "out"
    "testout"
  ];

  postInstall = ''
    mkdir $testout
    cp -R test $testout/test
  '';

  pythonImportsCheck = [ "PyKCS11" ];

  meta = {
    description = "PKCS#11 wrapper for Python";
    homepage = "https://github.com/LudovicRousseau/PyKCS11";
    license = lib.licenses.gpl2Plus;
    maintainers = [ ];
  };
}

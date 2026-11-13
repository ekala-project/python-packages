{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  swig,
}:

buildPythonPackage (finalAttrs: {
  pname = "pykcs11";
  version = "1.5.21";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-WBpS7dKdMzpCC1tCLdoLiKFMXsf6iYtY62lpRFo+RVQ=";
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
  };
})

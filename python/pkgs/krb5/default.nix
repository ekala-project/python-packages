{
  lib,
  buildPythonPackage,
  cython,
  fetchPypi,
  pkgs,
  setuptools,
}:

buildPythonPackage rec {
  pname = "krb5";
  version = "0.9.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-TN0shf9HcBCO2vSP7fGYiM+Vb/N04ul+QPhBKwSMruY=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "Cython ==" "Cython >="
  '';

  build-system = [
    cython
    setuptools
  ];

  nativeBuildInputs = [ pkgs.krb5 ];

  pythonImportsCheck = [ "krb5" ];

  meta = {
    description = "Kerberos API bindings for Python";
    homepage = "https://github.com/jborean93/pykrb5";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

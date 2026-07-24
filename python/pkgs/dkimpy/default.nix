{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  openssl,
  dnspython,
  pynacl,
  authres,
}:

buildPythonPackage rec {
  pname = "dkimpy";
  version = "1.1.8";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-tfYPtHu/XY12LxNLzqDDiOumtJg0KmgqIfFoZUUJS3c=";
  };

  build-system = [ setuptools ];

  patchPhase = ''
    substituteInPlace dkim/dknewkey.py --replace-fail /usr/bin/openssl ${openssl}/bin/openssl
  '';

  dependencies = [
    dnspython
    pynacl
    authres
  ];

  pythonImportsCheck = [ "dkim" ];

  meta = {
    description = "DKIM + ARC email signing/verification tools";
    homepage = "https://launchpad.net/dkimpy";
    license = lib.licenses.bsd3;
  };
}

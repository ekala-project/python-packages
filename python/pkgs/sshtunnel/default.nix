{
  lib,
  buildPythonPackage,
  fetchPypi,
  paramiko,
  mock,
  setuptools,
}:

buildPythonPackage rec {
  pname = "sshtunnel";
  version = "0.4.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-58sOp3Tbgb+RhE2yLecqQKro97D5u5ug9mbUdO9r+fw=";
  };

  # https://github.com/pahaz/sshtunnel/pull/301
  patches = [ ./paramiko-4.0-compat.patch ];

  build-system = [ setuptools ];

  dependencies = [ paramiko ];
  # disable impure tests
  meta = {
    description = "Pure python SSH tunnels";
    mainProgram = "sshtunnel";
    homepage = "https://github.com/pahaz/sshtunnel";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  cryptography,
}:

buildPythonPackage rec {
  version = "3.3.1";
  pname = "sshpubkeys";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ojarva";
    repo = "python-sshpubkeys";
    # https://github.com/ojarva/python-sshpubkeys/issues/94
    tag = "v3.2.0";
    hash = "sha256-2OJatnQuCt9XQ797F5nEmgEZl5/tu9lrAry5yBGW61g=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cryptography
  ];

  pythonImportsCheck = [ "sshpubkeys" ];

  meta = {
    description = "OpenSSH Public Key Parser for Python";
    homepage = "https://github.com/ojarva/python-sshpubkeys";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}

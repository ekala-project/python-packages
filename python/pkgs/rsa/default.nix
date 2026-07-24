{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  pyasn1,
}:

buildPythonPackage rec {
  pname = "rsa";
  version = "4.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sybrenstuvel";
    repo = "python-rsa";
    rev = "version-${version}";
    hash = "sha256-PwaRe+ICy0UoguXSMSh3PFl5R+YAhJwNdNN9isadlJY=";
  };

  nativeBuildInputs = [ poetry-core ];

  propagatedBuildInputs = [ pyasn1 ];

  meta = {
    homepage = "https://stuvel.eu/rsa";
    license = lib.licenses.asl20;
    description = "Pure-Python RSA implementation";
  };
}

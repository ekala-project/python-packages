{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  pyasn1,
}:

buildPythonPackage (finalAttrs: {
  pname = "rsa";
  version = "4.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sybrenstuvel";
    repo = "python-rsa";
    tag = "version-${finalAttrs.version}";
    hash = "sha256-PwaRe+ICy0UoguXSMSh3PFl5R+YAhJwNdNN9isadlJY=";
  };

  nativeBuildInputs = [ poetry-core ];

  dependencies = [ pyasn1 ];

  meta = {
    homepage = "https://stuvel.eu/rsa";
    license = lib.licenses.asl20;
    description = "Pure-Python RSA implementation";
  };
})

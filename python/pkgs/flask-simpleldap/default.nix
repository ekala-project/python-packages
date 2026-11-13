{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flask,
  python-ldap,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "flask-simpleldap";
  version = "2.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "alexferl";
    repo = "flask-simpleldap";
    tag = "v${finalAttrs.version}";
    hash = "sha256-v96mfuxp3/G/W85bWvZOJ7kMjYdL9lIxnzaNOikWaBE=";
  };

  build-system = [
    hatchling
  ];
  dependencies = [
    flask
    python-ldap
  ];

  pythonImportsCheck = [ "flask_simpleldap" ];

  meta = {
    description = "LDAP authentication extension for Flask";
    homepage = "https://github.com/alexferl/flask-simpleldap";
    license = lib.licenses.mit;
  };
})

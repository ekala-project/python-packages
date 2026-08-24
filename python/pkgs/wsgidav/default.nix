{ lib
, bcrypt
, buildPythonPackage
, cheroot
, defusedxml
, fetchFromGitHub
, jinja2
, json5
, lxml
, passlib
, python-pam
, pyyaml
, setuptools
,
}:

buildPythonPackage (finalAttrs: {
  pname = "wsgidav";
  version = "4.3.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mar10";
    repo = "wsgidav";
    tag = "v${finalAttrs.version}";
    hash = "sha256-LsHVCGXgeXjHJt6VfB+uKsYjqCybBRcweTGvoR8tJ1E=";
  };

  pythonRelaxDeps = [ "bcrypt" ];

  build-system = [ setuptools ];

  dependencies = [
    bcrypt
    defusedxml
    jinja2
    json5
    cheroot
    lxml
    passlib
    pyyaml
  ];

  optional-dependencies = {
    pam = [ python-pam ];
  };

  pythonImportsCheck = [ "wsgidav" ];

  meta = {
    description = "Generic and extendable WebDAV server based on WSGI";
    homepage = "https://wsgidav.readthedocs.io/";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "wsgidav";
  };
})

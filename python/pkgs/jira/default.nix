{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  defusedxml,
  ipython,
  keyring,
  packaging,
  pillow,
  pyjwt,
  requests,
  requests-futures,
  requests-oauthlib,
  requests-toolbelt,
  setuptools,
  setuptools-scm,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "jira";
  version = "3.10.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pycontribs";
    repo = "jira";
    tag = version;
    hash = "sha256-Gj9RmNJwmYQviXeNLL6WWFIO91jy6zY/s29Gy18lzyA=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  dependencies = [
    defusedxml
    packaging
    requests
    requests-oauthlib
    requests-toolbelt
    pillow
    typing-extensions
  ];

  optional-dependencies = {
    cli = [
      ipython
      keyring
    ];
    opt = [
      # filemagic
      pyjwt
      # requests-jwt
      # requests-keyberos
    ];
    async = [ requests-futures ];
  };
  pythonImportsCheck = [ "jira" ];

  # impure tests because of connectivity attempts to jira servers
  doCheck = false;

  meta = {
    description = "Library to interact with the JIRA REST API";
    homepage = "https://github.com/pycontribs/jira";
    license = lib.licenses.bsd2;
    maintainers = [ ];
    mainProgram = "jirashell";
  };
}

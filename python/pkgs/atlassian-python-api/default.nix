{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  beautifulsoup4,
  deprecated,
  jmespath,
  lxml,
  oauthlib,
  requests,
  requests-kerberos,
  requests-oauthlib,
  six,
  typing-extensions,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "atlassian-python-api";
  version = "5.0.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "atlassian-api";
    repo = "atlassian-python-api";
    tag = finalAttrs.version;
    hash = "sha256-htzeUsJzGYldqyFitzwjE3PmPRFXd3+2ZVXnmRKRSEU=";
  };

  build-system = [ setuptools ];

  dependencies = [
    beautifulsoup4
    deprecated
    jmespath
    lxml
    oauthlib
    requests
    requests-kerberos
    requests-oauthlib
    six
    typing-extensions
  ];
  pythonImportsCheck = [ "atlassian" ];

  meta = {
    description = "Python Atlassian REST API Wrapper";
    homepage = "https://github.com/atlassian-api/atlassian-python-api";
    license = lib.licenses.asl20;
  };
})

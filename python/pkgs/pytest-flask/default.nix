{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  setuptools-scm
, # buildInputs
  pytest
, # dependencies
  flask
, werkzeug
,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytest-flask";
  version = "1.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pytest-dev";
    repo = "pytest-flask";
    tag = finalAttrs.version;
    hash = "sha256-mcBHpP6A+ehqowDccfcn+wv6WXRrF0cY9ez7kqkb3Hc=";
  };

  build-system = [ setuptools-scm ];

  buildInputs = [ pytest ];

  dependencies = [
    flask
    werkzeug
  ];

  pythonImportsCheck = [ "pytest_flask" ];

  meta = {
    description = "Set of pytest fixtures to test Flask applications";
    homepage = "https://pytest-flask.readthedocs.io/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})

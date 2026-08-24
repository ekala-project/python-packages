{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  maya,
  requests,
  setuptools,
}:

buildPythonPackage rec {
  pname = "secure";
  version = "1.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "typeerror";
    repo = "secure.py";
    tag = "v${version}";
    hash = "sha256-lyosOejztFEINGKO0wAYv3PWBL7vpmAq+eQunwP9h5I=";
  };

  build-system = [ setuptools ];

  dependencies = [
    maya
    requests
  ];

  pythonImportsCheck = [ "secure" ];

  meta = {
    description = "Adds optional security headers and cookie attributes for Python web frameworks";
    homepage = "https://github.com/TypeError/secure.py";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

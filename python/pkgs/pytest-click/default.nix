{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytest,
  click,
}:

buildPythonPackage rec {
  pname = "pytest-click";
  version = "1.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Stranger6667";
    repo = "pytest-click";
    tag = "v${version}";
    hash = "sha256-A/RF+SgPu2yYF3eHEFiZwKJW2VwQ185Ln6S3wn2cS0k=";
  };

  build-system = [ setuptools ];

  buildInputs = [ pytest ];

  dependencies = [ click ];

  meta = {
    description = "Pytest plugin for click";
    homepage = "https://github.com/Stranger6667/pytest-click";
    license = lib.licenses.mit;
  };
}

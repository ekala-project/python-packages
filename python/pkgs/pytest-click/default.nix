{ lib
, buildPythonPackage
, fetchFromGitHub
, pytest
, click
,
}:

buildPythonPackage rec {
  pname = "pytest-click";
  version = "1.1.0";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "Stranger6667";
    repo = "pytest-click";
    rev = "v${version}";
    hash = "sha256-A/RF+SgPu2yYF3eHEFiZwKJW2VwQ185Ln6S3wn2cS0k=";
  };

  buildInputs = [ pytest ];

  propagatedBuildInputs = [ click ];

  meta = {
    description = "Pytest plugin for click";
    homepage = "https://github.com/Stranger6667/pytest-click";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

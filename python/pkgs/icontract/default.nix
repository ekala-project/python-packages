{ lib
, asttokens
, buildPythonPackage
, fetchFromGitHub
, setuptools
, typing-extensions
,
}:

buildPythonPackage rec {
  pname = "icontract";
  version = "2.7.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Parquery";
    repo = "icontract";
    tag = "v${version}";
    hash = "sha256-UYBskomnu53A9VCY7y7zAOQm40Y+INOqPK6IqZsk6h0=";
  };

  build-system = [ setuptools ];

  dependencies = [
    asttokens
    typing-extensions
  ];
  pythonRelaxDeps = [
    "asttokens"
  ];

  pythonImportsCheck = [ "icontract" ];

  meta = {
    description = "Provide design-by-contract with informative violation messages";
    homepage = "https://github.com/Parquery/icontract";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

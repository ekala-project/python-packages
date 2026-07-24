{
  lib,
  buildPythonPackage,
  colorful,
  docopt,
  fetchFromGitHub,
  freezegun,
  humanize,
  lxml,
  parse-type,
  pytest-mock,
  pyyaml,
  tag-expressions,
}:

buildPythonPackage rec {
  pname = "radish-bdd";
  version = "0.18.4";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = pname;
    repo = "radish";
    tag = "v${version}";
    hash = "sha256-pnZ/vqjMd1Q/wF1W6joYrIulZSXAzS2G3E5Ke5VSAQg=";
  };

  propagatedBuildInputs = [
    colorful
    docopt
    humanize
    lxml
    parse-type
    pyyaml
    tag-expressions
  ];
  pythonImportsCheck = [ "radish" ];

  meta = {
    description = "Behaviour-Driven-Development tool for python";
    homepage = "https://radish-bdd.github.io/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

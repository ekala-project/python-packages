{
  lib,
  buildPythonPackage,
  colorama,
  fetchFromGitHub,
  regex,
  hatchling,
}:

buildPythonPackage rec {
  pname = "tatsu";
  version = "5.24.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "neogeny";
    repo = "TatSu";
    tag = "v${version}";
    hash = "sha256-FJBtZ8OP/Tv4KUvJBwuyP1HCco9XW4Z9ODpPFn2tKss=";
  };

  nativeBuildInputs = [ hatchling ];

  propagatedBuildInputs = [
    colorama
    regex
  ];

  pythonImportsCheck = [ "tatsu" ];

  meta = {
    description = "Generates Python parsers from grammars in a variation of EBNF";
    homepage = "https://tatsu.readthedocs.io/";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}

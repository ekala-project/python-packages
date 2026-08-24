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
  version = "5.16.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "neogeny";
    repo = "TatSu";
    tag = "v${version}";
    hash = "sha256-YFNoA81J8x4OO7lLUjeN/NzQfCTEeosaWZg9UKy8C50=";
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

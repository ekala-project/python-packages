{
  lib,
  buildPythonPackage,
  colorama,
  fetchFromGitHub,
  regex,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "tatsu";
  version = "5.24.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "neogeny";
    repo = "TatSu";
    tag = "v${finalAttrs.version}";
    hash = "sha256-FJBtZ8OP/Tv4KUvJBwuyP1HCco9XW4Z9ODpPFn2tKss=";
  };

  # the v5.24.0 tag carries a development version string that tatsu cannot parse
  postPatch = ''
    substituteInPlace tatsu/_version.py \
      --replace-fail "__version__ = 'v5.24.1-b.1'" "__version__ = '${finalAttrs.version}'"
  '';

  build-system = [ hatchling ];

  dependencies = [
    colorama
    regex
  ];

  pythonImportsCheck = [ "tatsu" ];

  meta = {
    description = "Generates Python parsers from grammars in a variation of EBNF";
    homepage = "https://tatsu.readthedocs.io/";
    license = lib.licenses.bsd2;
  };
})

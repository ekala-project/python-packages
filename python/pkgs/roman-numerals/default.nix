{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "roman-numerals";
  version = "4.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "AA-Turner";
    repo = "roman-numerals";
    tag = "v${finalAttrs.version}";
    hash = "sha256-v+aPIcsggjRJ3l6Xfw97b3zcqpyWNY4XWy2+5aWyitY=";
  };

  sourceRoot = "${finalAttrs.src.name}/python";

  build-system = [ flit-core ];
  pythonImportsCheck = [ "roman_numerals" ];

  meta = {
    description = "Manipulate roman numerals";
    homepage = "https://github.com/AA-Turner/roman-numerals/";
    license = lib.licenses.cc0;
    platforms = lib.platforms.all;
  };
})

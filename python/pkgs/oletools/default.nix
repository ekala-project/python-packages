{
  lib,
  buildPythonPackage,
  colorclass,
  fetchFromGitHub,
  msoffcrypto-tool,
  olefile,
  pcodedmp,
  setuptools,
  pyparsing,
}:

buildPythonPackage (finalAttrs: {
  pname = "oletools";
  version = "0.60.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "decalage2";
    repo = "oletools";
    tag = "v${finalAttrs.version}";
    hash = "sha256-ons1VeWStxUZw2CPpnX9p5I3Q7cMhi34JU8TeuUDt+Y=";
  };

  pythonRelaxDeps = [ "pyparsing" ];

  build-system = [ setuptools ];

  dependencies = [
    colorclass
    msoffcrypto-tool
    olefile
    pcodedmp
    pyparsing
  ];

  pythonImportsCheck = [ "oletools" ];

  meta = {
    description = "Module to analyze MS OLE2 files and MS Office documents";
    homepage = "https://github.com/decalage2/oletools";
    license = with lib.licenses; [
      bsd2
      mit
    ];
    maintainers = [ ];
  };
})

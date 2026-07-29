{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  extract-msg,
}:

buildPythonPackage (finalAttrs: {
  pname = "mail-parser";
  version = "4.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "SpamScope";
    repo = "mail-parser";
    tag = finalAttrs.version;
    hash = "sha256-fuL2cWQSkYQKhG/UVNOp4ch4MrZINizvsPCQUzb3Z9c=";
  };

  build-system = [ hatchling ];

  optional-dependencies = {
    outlook = [ extract-msg ];
  };

  pythonImportsCheck = [ "mailparser" ];

  meta = {
    description = "Mail parser for python 2 and 3";
    mainProgram = "mail-parser";
    homepage = "https://github.com/SpamScope/mail-parser";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})

{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  linetable,
}:

buildPythonPackage rec {
  pname = "kajiki";
  version = "1.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jackrosenthal";
    repo = "kajiki";
    tag = "v${version}";
    hash = "sha256-bAgUMA9PlwsO7FRjwiKCsFffLWNU+Go1DToblmyWprk=";
  };

  build-system = [ hatchling ];

  dependencies = [ linetable ];

  pythonImportsCheck = [ "kajiki" ];

  meta = {
    description = "Module provides fast well-formed XML templates";
    mainProgram = "kajiki";
    homepage = "https://github.com/jackrosenthal/kajiki";
    changelog = "https://github.com/jackrosenthal/kajiki/releases/tag/v${version}";
    license = lib.licenses.mit;
  };
}

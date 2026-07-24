{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  hatch-vcs,
  click,
}:

buildPythonPackage rec {
  pname = "click-option-group";
  version = "0.5.9";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "click-contrib";
    repo = "click-option-group";
    tag = "v${version}";
    hash = "sha256-ASzX80aZB3SQqz8AgDTJTE1jgY+MgA0P5yTW9m6+Ovk=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [ click ];

  pythonImportsCheck = [ "click_option_group" ];

  meta = {
    description = "Option groups missing in Click";
    homepage = "https://github.com/click-contrib/click-option-group";
    license = lib.licenses.bsd3;
  };
}

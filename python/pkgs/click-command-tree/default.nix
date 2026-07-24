{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  click,
}:

buildPythonPackage (finalAttrs: {
  pname = "click-command-tree";
  version = "1.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "whwright";
    repo = "click-command-tree";
    tag = finalAttrs.version;
    hash = "sha256-oshAHCGe8p5BQ0W21bXSxrTCEFgIxZ6BmUEiWB1xAoI=";
  };

  build-system = [ setuptools ];

  dependencies = [ click ];

  pythonImportsCheck = [ "click_command_tree" ];

  meta = {
    description = "Click plugin to show the command tree of your CLI";
    homepage = "https://github.com/whwright/click-command-tree";
    license = lib.licenses.mit;
  };
})

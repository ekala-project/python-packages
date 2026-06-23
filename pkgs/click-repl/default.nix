{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  click,
  prompt-toolkit,
  six,
}:

buildPythonPackage rec {
  pname = "click-repl";
  version = "0.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "click-contrib";
    repo = "click-repl";
    tag = version;
    hash = "sha256-xCT3w0DDY73dtDL5jbssXM05Zlr44OOcy4vexgHyWiE=";
  };

  nativeBuildInputs = [ setuptools ];

  propagatedBuildInputs = [
    click
    prompt-toolkit
    six
  ];

  pythonImportsCheck = [ "click_repl" ];

  meta = {
    homepage = "https://github.com/click-contrib/click-repl";
    description = "Subcommand REPL for click apps";
    license = lib.licenses.mit;
  };
}

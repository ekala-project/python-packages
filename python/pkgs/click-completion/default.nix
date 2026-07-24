{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  click,
  jinja2,
  shellingham,
  six,
}:

buildPythonPackage rec {
  pname = "click-completion";
  version = "0.5.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-W/gWuBNn5jihkLbpG1B3kAfRQwGz+fMUXWjjyt57zoY=";
  };

  build-system = [ setuptools ];

  dependencies = [
    click
    jinja2
    shellingham
    six
  ];

  pythonImportsCheck = [ "click_completion" ];

  meta = {
    description = "Add or enhance bash, fish, zsh and powershell completion in Click";
    homepage = "https://github.com/click-contrib/click-completion";
    license = lib.licenses.mit;
  };
}

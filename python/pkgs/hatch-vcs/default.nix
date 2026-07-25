{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "hatch-vcs";
  version = "0.5.0";
  pyproject = true;

  src = fetchPypi {
    pname = "hatch_vcs";
    inherit version;
    hash = "sha256-A5X6EmlANAIVCQw0Siv04qd7y+faqxb0Gze5jJWAn/k=";
  };

  build-system = [ hatchling ];

  dependencies = [
    hatchling
    setuptools-scm
  ];
  pythonImportsCheck = [ "hatch_vcs" ];

  meta = {
    description = "Plugin for Hatch that uses your preferred version control system (like Git) to determine project versions";
    homepage = "https://github.com/ofek/hatch-vcs";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

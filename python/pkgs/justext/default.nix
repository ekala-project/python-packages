{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytest-cov-stub,
  lxml,
  lxml-html-clean,
}:

buildPythonPackage rec {
  pname = "justext";
  version = "3.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "miso-belica";
    repo = "jusText";
    tag = "v${version}";
    hash = "sha256-/7wp41jz/5nUFqZNg4O7yF2+eE+awAEXp6dhD+Loc0U=";
  };

  build-system = [ setuptools ];

  dependencies = [
    lxml
    lxml-html-clean
  ];
  pythonImportsCheck = [ "justext" ];

  meta = {
    description = "Heuristic based boilerplate removal tool";
    homepage = "https://github.com/miso-belica/jusText";
    license = lib.licenses.bsd2;
  };
}

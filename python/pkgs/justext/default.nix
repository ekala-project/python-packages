{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytest-cov-stub,
  lxml,
  lxml-html-clean,
}:

buildPythonPackage rec {
  pname = "justext";
  version = "3.0.2";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "miso-belica";
    repo = "jusText";
    tag = "v${version}";
    hash = "sha256-/7wp41jz/5nUFqZNg4O7yF2+eE+awAEXp6dhD+Loc0U=";
  };

  propagatedBuildInputs = [
    lxml
    lxml-html-clean
  ];
  pythonImportsCheck = [ "justext" ];

  meta = {
    description = "Heuristic based boilerplate removal tool";
    homepage = "https://github.com/miso-belica/jusText";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}

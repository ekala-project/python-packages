{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  lxml,
  unittestCheckHook,
}:

buildPythonPackage rec {
  pname = "lxml-html-clean";
  version = "0.4.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fedora-python";
    repo = "lxml_html_clean";
    tag = version;
    hash = "sha256-mToWK2Cc2cfBmEqcL5z61WydQUb78TWZDGGLR9kNliA=";
  };

  build-system = [ setuptools ];

  dependencies = [ lxml ];
  pythonImportsCheck = [ "lxml_html_clean" ];

  meta = {
    description = "Separate project for HTML cleaning functionalities copied from lxml.html.clean";
    homepage = "https://github.com/fedora-python/lxml_html_clean/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}

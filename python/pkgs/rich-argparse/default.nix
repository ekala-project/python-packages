{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  rich,
}:

buildPythonPackage rec {
  pname = "rich-argparse";
  version = "1.7.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "hamdanal";
    repo = "rich-argparse";
    tag = "v${version}";
    hash = "sha256-gzPz8vRxZyZ6Du2r4PdqHjeeLkXZV8eDdX0d+TMrVUc=";
  };

  build-system = [ hatchling ];

  dependencies = [ rich ];
  pythonImportsCheck = [ "rich_argparse" ];

  meta = {
    description = "Format argparse help output using rich";
    homepage = "https://github.com/hamdanal/rich-argparse";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

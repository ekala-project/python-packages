{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  rich,
}:

buildPythonPackage rec {
  pname = "rich-argparse";
  version = "1.8.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "hamdanal";
    repo = "rich-argparse";
    tag = "v${version}";
    hash = "sha256-ze9wJn+Cxz/NhbG8xKwHZHaDqMdU142/vJjml3Y9508=";
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

{
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  lib,
  pyyaml,
  six,
  lxml,
}:

buildPythonPackage rec {
  pname = "ipyxact";
  version = "0.3.2";
  pyproject = true;

  dependencies = [ pyyaml ];
  nativeCheckInputs = [
    six
    lxml
  ];

  src = fetchFromGitHub {
    owner = "olofk";
    repo = "ipyxact";
    tag = "v${version}";
    hash = "sha256-myD+NnqcxxaSAV7qZa8xqeciaiFqFePqIzd7sb/2GXA=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "ipyxact" ];

  meta = {
    homepage = "https://github.com/olofk/ipyxact";
    description = "IP-XACT parser";
    mainProgram = "ipxact2v";
    license = lib.licenses.mit;
  };
}

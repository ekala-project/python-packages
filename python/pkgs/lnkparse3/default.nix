{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pytestCheckHook,
  pyyaml,
  setuptools,
}:

buildPythonPackage rec {
  pname = "lnkparse3";
  version = "1.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Matmaus";
    repo = "LnkParse3";
    tag = "v${version}";
    hash = "sha256-nTU6FMHM0hRwHBgszixZLArbhKKJmtwUXZC8ZW1KOvk=";
  };

  build-system = [ setuptools ];

  dependencies = [ pyyaml ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "LnkParse3" ];

  meta = {
    description = "Windows Shortcut file (LNK) parser";
    homepage = "https://github.com/Matmaus/LnkParse3";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

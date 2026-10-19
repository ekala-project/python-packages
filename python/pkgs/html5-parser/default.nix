{
  lib,
  beautifulsoup4,
  buildPythonPackage,
  chardet,
  fetchFromGitHub,
  # build-system
  setuptools,
  lxml,
  pkg-config,
  pkgs,
  pytestCheckHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "html5-parser";
  version = "0.4.12";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "kovidgoyal";
    repo = "html5-parser";
    tag = "v${finalAttrs.version}";
    hash = "sha256-0Qn+To/d3+HMx+KhhgJBEHVYPOfIeBnngBraY7r4uSs=";
  };

  build-system = [ setuptools ];

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ pkgs.libxml2 ];

  dependencies = [
    chardet
    lxml
  ];

  nativeCheckInputs = [
    beautifulsoup4
    pytestCheckHook
  ];

  pythonImportsCheck = [ "html5_parser" ];

  enabledTestPaths = [ "test/*.py" ];

  meta = {
    description = "Fast C based HTML 5 parsing for python";
    homepage = "https://html5-parser.readthedocs.io";
    license = lib.licenses.asl20;
  };
})

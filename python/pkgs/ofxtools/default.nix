{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  pytestCheckHook,
}:

buildPythonPackage rec {
  pname = "ofxtools";
  version = "1.1.1";
  pyproject = true;

  # PyPI distribution does not include tests
  src = fetchFromGitHub {
    owner = "csingley";
    repo = "ofxtools";
    rev = version;
    hash = "sha256-874xcs5M5K6JxYoz9xhbZM/VZICZshHe9nb2C3HAQLA=";
  };

  build-system = [ setuptools ];

  nativeCheckInputs = [ pytestCheckHook ];
  # override $HOME directory:
  #   error: [Errno 13] Permission denied: '/homeless-shelter'
  preCheck = ''
    export HOME=$(mktemp -d)
  '';

  meta = {
    homepage = "https://github.com/csingley/ofxtools";
    description = "Library for working with Open Financial Exchange (OFX) formatted data used by financial institutions";
    mainProgram = "ofxget";
    license = lib.licenses.gpl3Only;
  };
}

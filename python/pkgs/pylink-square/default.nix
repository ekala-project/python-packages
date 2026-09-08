{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  # dependencies
  psutil,
  six,
}:

buildPythonPackage rec {
  pname = "pylink-square";
  version = "2.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "square";
    repo = "pylink";
    tag = "v${version}";
    hash = "sha256-r0LqyyYKnwyabxuV4xRlr+0ix77zw519+VAat2it1G4=";
  };

  patches = [
    # ERROR: /build/source/setup.cfg:16: unexpected value continuation
    ./fix-setup-cfg-syntax.patch
  ];

  build-system = [ setuptools ];

  dependencies = [
    psutil
    six
  ];

  pythonImportsCheck = [ "pylink" ];

  meta = {
    description = "Python interface for the SEGGER J-Link";
    homepage = "https://github.com/square/pylink";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}

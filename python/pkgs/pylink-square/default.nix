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
  version = "1.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "square";
    repo = "pylink";
    tag = "v${version}";
    hash = "sha256-rkkdnpkl9UHcBDjp6lsFXR1zNn7tH1KeTQ7wV+yJ3m0=";
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

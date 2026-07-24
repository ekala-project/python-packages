{
  lib,
  buildPythonPackage,
  fetchFromCodeberg,
  setuptools,
  setuptools-scm,
  hypothesis,
  pytest-benchmark,
  pytest-timeout,
}:

buildPythonPackage rec {
  pname = "pyppmd";
  version = "1.1.1";
  pyproject = true;

  src = fetchFromCodeberg {
    owner = "miurahr";
    repo = "pyppmd";
    tag = "v${version}";
    hash = "sha256-0t1vyVMtmhb38C2teJ/Lq7dx4usm4Bzx+k7Zalf/nXE=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];
  pythonImportsCheck = [
    "pyppmd"
  ];

  meta = {
    description = "PPMd compression/decompression library";
    homepage = "https://codeberg.org/miurahr/pyppmd";
    license = lib.licenses.gpl2Plus;
    maintainers = [ ];
  };
}

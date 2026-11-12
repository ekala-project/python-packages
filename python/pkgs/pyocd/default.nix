{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools-scm,
  # dependencies
  capstone,
  cmsis-pack-manager,
  colorama,
  importlib-metadata,
  importlib-resources,
  intelhex,
  intervaltree,
  lark,
  natsort,
  prettytable,
  pyelftools,
  pylink-square,
  pyusb,
  pyyaml,
  typing-extensions,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyocd";
  version = "0.45.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyocd";
    repo = "pyOCD";
    tag = "v${finalAttrs.version}";
    hash = "sha256-GEKPSAoAqDsAQ+RSr1MkDosO4KTiwx5yX71fg3xwzEc=";
  };

  pythonRelaxDeps = [
    "capstone"
    "pylink-square"
  ];
  pythonRemoveDeps = [ "libusb-package" ];

  build-system = [ setuptools-scm ];

  dependencies = [
    capstone
    cmsis-pack-manager
    colorama
    importlib-metadata
    importlib-resources
    intelhex
    intervaltree
    lark
    natsort
    prettytable
    pyelftools
    pylink-square
    pyusb
    pyyaml
    typing-extensions
  ];
  pythonImportsCheck = [ "pyocd" ];

  meta = {
    description = "Python library for programming and debugging Arm Cortex-M microcontrollers";
    downloadPage = "https://github.com/pyocd/pyOCD";
    homepage = "https://pyocd.io";
    license = lib.licenses.asl20;
  };
})

{
  lib,
  fetchFromGitHub,
  buildPythonPackage,

  # build-system
  setuptools,

  # dependencies
  deprecation,
  prompt-toolkit,
  pyusb,
  pyvcd,
  pyxdg,
}:

buildPythonPackage (finalAttrs: {
  pname = "apollo-fpga";
  version = "1.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "greatscottgadgets";
    repo = "apollo";
    tag = "v${finalAttrs.version}";
    hash = "sha256-EDI+bRDePEbkxfQKuDgRsJtlAE0jqcIoQHjpgW0jIoY=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"setuptools-git-versioning<2"' "" \
      --replace-fail 'dynamic = ["version"]' 'version = "${finalAttrs.version}"'
  '';

  build-system = [
    setuptools
  ];

  dependencies = [
    deprecation
    prompt-toolkit
    pyusb
    pyvcd
    pyxdg
  ];

  # has no tests

  pythonImportsCheck = [
    "apollo_fpga"
  ];

  meta = {
    description = "Microcontroller-based FPGA / JTAG programmer";
    homepage = "https://github.com/greatscottgadgets/apollo";
    license = lib.licenses.bsd3;
  };
})

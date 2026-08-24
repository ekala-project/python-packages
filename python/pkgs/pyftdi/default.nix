{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pyserial,
  pyusb,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyftdi";
  version = "0.57.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "eblot";
    repo = "pyftdi";
    tag = "v${finalAttrs.version}";
    hash = "sha256-v6WcDwKVnLB2SwWiKG0VYg1VTyaSDz0QvG3hAQs7YHI=";
  };

  build-system = [ setuptools ];

  dependencies = [
    pyserial
    pyusb
  ];

  pythonImportsCheck = [ "pyftdi" ];

  meta = {
    description = "User-space driver for modern FTDI devices";
    homepage = "https://github.com/eblot/pyftdi";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
})

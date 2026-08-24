{ lib
, buildPythonPackage
, fetchFromGitLab
, setuptools
, cryptography
, pefile
,
}:

buildPythonPackage (finalAttrs: {
  pname = "virt-firmware";
  version = "25.12";
  pyproject = true;

  src = fetchFromGitLab {
    owner = "kraxel";
    repo = "virt-firmware";
    tag = "v${finalAttrs.version}";
    hash = "sha256-sopmWZ8CdLuc0R+QN7MSoqT9kURzOyh9CgbreKuvANw=";
  };

  build-system = [ setuptools ];

  dependencies = [
    setuptools
    cryptography
    pefile
  ];

  pythonImportsCheck = [ "virt.firmware.efi" ];

  meta = {
    description = "Tools for virtual machine firmware volumes";
    homepage = "https://gitlab.com/kraxel/virt-firmware";
    license = lib.licenses.gpl2Only;
    maintainers = [ ];
  };
})

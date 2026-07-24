{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
}:

buildPythonPackage rec {
  pname = "bitmath";
  version = "2.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "timlnx";
    repo = "bitmath";
    tag = "v${version}";
    hash = "sha256-9hiwIpDIAU+N+LhlJ9qlKBZQibbrwwhGM77fvEnABRI=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "bitmath" ];

  meta = {
    description = "Module for representing and manipulating file sizes with different prefix";
    homepage = "https://github.com/timlnx/bitmath";
    changelog = "https://github.com/timlnx/bitmath/releases/tag/v${version}";
    license = lib.licenses.mit;
  };
}

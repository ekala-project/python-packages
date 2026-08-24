{
  lib,
  buildPythonPackage,
  click,
  fetchFromGitHub,
  fetchpatch,
  setuptools,
  six,
}:

buildPythonPackage rec {
  pname = "xdis";
  version = "6.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "rocky";
    repo = "python-xdis";
    tag = version;
    hash = "sha256-k1SawlgbItbWe8J2pAxYOku/4CHyzWH3UR1j3kBZy1Q=";
  };

  patches = [
    (fetchpatch {
      name = "python-3.13.13.patch";
      url = "https://github.com/rocky/python-xdis/commit/f2c46c8c89898157c2345c0a026a2d31f14e7ea9.patch";
      includes = [ "xdis/magics.py" ];
      hash = "sha256-+k3mbiAmM69Pl7k0Wogx+qpib5+p3Gn/pSpnDn5e6pE=";
    })
    (fetchpatch {
      name = "python-3.14.4.patch";
      url = "https://github.com/rocky/python-xdis/commit/36a1a2442c224e3bfca776f727a5e262968855a4.patch";
      includes = [ "xdis/magics.py" ];
      hash = "sha256-q+MX737Xn+iUObuV5IirnT71/0W6JH0TgtmS1cqR0x4=";
    })
  ];

  build-system = [
    setuptools
  ];

  dependencies = [
    click
    six
  ];

  pythonImportsCheck = [ "xdis" ];

  meta = {
    description = "Python cross-version byte-code disassembler and marshal routines";
    homepage = "https://github.com/rocky/python-xdis";
    license = lib.licenses.gpl2Plus;
    maintainers = [ ];
  };
}

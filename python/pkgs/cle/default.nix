{
  lib,
  archinfo,
  buildPythonPackage,
  cart,
  cffi,
  fetchFromGitHub,
  pefile,
  pyelftools,
  pyvex,
  setuptools,
  sortedcontainers,
  nix-update-script,
}:

let
  # The binaries are following the argr projects release cycle
  version = "9.2.154";

  # Binary files from https://github.com/angr/binaries (only used for testing and only here)
  binaries = fetchFromGitHub {
    owner = "angr";
    repo = "binaries";
    tag = "v${version}";
    hash = "sha256-XXJBySIT3ylK1nd3suP2bq4bVSVah/1XhOmkEONbCoY=";
  };
in
buildPythonPackage rec {
  pname = "cle";
  inherit version;
  pyproject = true;

  src = fetchFromGitHub {
    owner = "angr";
    repo = "cle";
    tag = "v${version}";
    hash = "sha256-rWbZzm5hWi/C+te8zeQChxqYHO0S795tJ6Znocq9TTs=";
  };

  build-system = [ setuptools ];

  dependencies = [
    archinfo
    cart
    cffi
    pefile
    pyelftools
    pyvex
    sortedcontainers
  ];

  # Place test binaries in the right location (location is hard-coded in the tests)

  pythonImportsCheck = [ "cle" ];

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Python loader for many binary formats";
    homepage = "https://github.com/angr/cle";
    license = lib.licenses.bsd2;
    maintainers = [ ];
  };
}

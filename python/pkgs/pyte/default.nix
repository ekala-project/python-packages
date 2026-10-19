{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  wcwidth,
}:

buildPythonPackage (finalAttrs: {
  pname = "pyte";
  version = "0.8.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "selectel";
    repo = "pyte";
    tag = finalAttrs.version;
    hash = "sha256-u24ltX/LEteiZ2a/ioKqxV2AZgrFmKOHXmySmw21sLE=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    # Remove pytest-runner dependency since it is not supported in the NixOS
    # sandbox
    sed -i '/pytest-runner/d' setup.py
  '';

  dependencies = [ wcwidth ];
  pythonImportsCheck = [ "pyte" ];

  meta = {
    description = "Simple VTXXX-compatible linux terminal emulator";
    homepage = "https://github.com/selectel/pyte";
    license = lib.licenses.lgpl3;
  };
})

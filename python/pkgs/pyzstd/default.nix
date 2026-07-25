{
  backports-zstd,
  buildPythonPackage,
  fetchFromGitHub,
  lib,
  hatchling,
  hatch-vcs,
  pythonOlder,
  typing-extensions,
  zstd,
}:

buildPythonPackage rec {
  pname = "pyzstd";
  version = "0.19.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Rogdham";
    repo = "pyzstd";
    tag = version;
    hash = "sha256-1oUqnZCBJYu8haFIQ+T2KaSQaa1xnZyJHLzOQg4Fdw8=";
  };

  postPatch = ''
    # pyzst needs a copy of upstream zstd's license
    ln -s ${zstd.src}/LICENSE zstd
  '';

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    backports-zstd
  ]
  ++ lib.optionals (pythonOlder "3.13") [
    typing-extensions
  ];

  pythonRelaxDeps = [
    "typing-extensions"
  ];

  buildInputs = [
    zstd
  ];

  pypaBuildFlags = [
    "--config-setting=--global-option=--dynamic-link-zstd"
  ];

  pythonImportsCheck = [
    "pyzstd"
  ];

  meta = {
    description = "Python bindings to Zstandard (zstd) compression library";
    homepage = "https://pyzstd.readthedocs.io";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}

{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  replaceVars,
  uv,

  # build-system,
  hatch-vcs,
  hatchling,

  # dependencies
  click,
  httpx,
  hyperlink,
  keyring,
  packaging,
  pexpect,
  platformdirs,
  pyproject-hooks,
  python-discovery,
  rich,
  shellingham,
  tomli-w,
  tomlkit,
  userpath,
  virtualenv,
  # python<3.14 only
  pythonOlder,
  backports-zstd,

  # tests

  nix-update-script,
}:

buildPythonPackage (finalAttrs: {
  pname = "hatch";
  version = "1.16.5";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pypa";
    repo = "hatch";
    tag = "hatch-v${finalAttrs.version}";
    hash = "sha256-pUlRy8ar0zXsGGSA1VTZyPiU4LruYp/maU2C5T4E5WI=";
  };

  patches = [
    (replaceVars ./inject-uv-path.patch {
      uv = lib.getExe uv;
    })
  ];

  build-system = [
    hatchling
    hatch-vcs
  ];

  pythonRemoveDeps = [
    "uv"
  ];
  pythonRelaxDeps = [
    "virtualenv"
  ];
  dependencies = [
    click
    hatchling
    httpx
    hyperlink
    keyring
    packaging
    pexpect
    platformdirs
    pyproject-hooks
    python-discovery
    rich
    shellingham
    tomli-w
    tomlkit
    userpath
    virtualenv
  ]
  ++ lib.optionals (pythonOlder "3.14") [
    backports-zstd
  ];
  passthru = {
    updateScript = nix-update-script {
      extraArgs = [
        "--version-regex"
        "hatch-v([0-9.]+)"
      ];
    };
  };

  meta = {
    description = "Modern, extensible Python project manager";
    homepage = "https://hatch.pypa.io/latest/";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "hatch";
  };
})

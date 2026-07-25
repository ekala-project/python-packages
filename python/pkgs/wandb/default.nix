{
  lib,
  stdenv,
  fetchFromGitHub,
  pythonAtLeast,

  ## wandb-core
  buildGoModule,
  gitMinimal,
  writableTmpDirAsHomeHook,
  versionCheckHook,

  ## wandb-xpu
  rustPlatform,

  ## wandb
  buildPythonPackage,

  # build-system
  hatchling,

  # dependencies
  click,
  packaging,
  platformdirs,
  protobuf,
  pydantic,
  pyyaml,
  requests,
  sentry-sdk,
  setproctitle,
  pythonOlder,
  typing-extensions,
}:

let
  version = "0.28.1";
  src = fetchFromGitHub {
    owner = "wandb";
    repo = "wandb";
    tag = "v${version}";
    hash = "sha256-yXsSHyPOh3QXRRkTL4Rj8lLuFjp1LIKfPiacy4+obAk=";
  };

  wandb-xpu = rustPlatform.buildRustPackage {
    pname = "wandb-xpu";
    version = "0.7.0";
    inherit src;

    sourceRoot = "${src.name}/xpu";

    cargoHash = "sha256-vB0LZjfnf//U1BXCzvaQBjlXLlGx/4g+emSZWcS+oGU=";

    checkFlags = [
      # fails in sandbox
      "--skip=gpu_amd::tests::test_gpu_amd_new"

      # tries to download libtpu wheel from PyPI
      "--skip=tpu_libtpu::tests::test_libtpu_sdk"
    ];

    nativeInstallCheckInputs = [
      versionCheckHook
    ];
    doInstallCheck = true;

    meta = {
      mainProgram = "wandb-xpu";
    };
  };

  inherit (stdenv.hostPlatform.extensions) sharedLibrary;
  libRustParquet = "librust_parquet_ffi${sharedLibrary}";

  parquet-rust-wrapper = rustPlatform.buildRustPackage {
    pname = "arrow-rs-wrapper";
    version = "0.1.0";
    inherit src;

    sourceRoot = "${src.name}/parquet-rust-wrapper";

    cargoHash = "sha256-BkeSRbZoehYGHj15KcInugRBvOLXJlh1NqTHhRnNOK8=";

    # The original build script renames the library:
    # https://github.com/wandb/wandb/blob/v0.26.0/parquet-rust-wrapper/build.sh#L37-L68
    postInstall = ''
      mv $out/lib/libarrow_rs_wrapper${sharedLibrary} $out/lib/${libRustParquet}
    '';
  };

  wandb-core = buildGoModule {
    pname = "wandb-core";
    inherit src version;

    sourceRoot = "${src.name}/core";

    postPatch =
      # Relax the Go toolchain requirement; nixpkgs ships 1.26.2.
      ''
        substituteInPlace go.mod \
          --replace-fail \
            "go 1.26.4" \
            "go 1.26.2"
      ''
      # hardcode the `wandb-xpu` binary path.
      + ''
        substituteInPlace internal/monitor/xpuresourcemanager.go \
          --replace-fail \
            'cmdPath, err := getXPUCmdPath()' \
            'cmdPath, err := "${lib.getExe wandb-xpu}", error(nil)'
      ''
      # hardcode the `parquet-rust-wrapper` library path.
      + ''
        substituteInPlace internal/runhistoryreader/parquet/ffi/rustarrowreader.go \
          --replace-fail \
            "${libRustParquet}" \
            "${lib.getLib parquet-rust-wrapper}/lib/${libRustParquet}"
      '';

    vendorHash = null;

    nativeBuildInputs = [
      gitMinimal
      writableTmpDirAsHomeHook
    ];

    nativeInstallCheckInputs = [
      versionCheckHook
    ];
    doInstallCheck = true;

    checkFlags =
      let
        skippedTests = [
          # gpu sampling crashes in the sandbox
          "TestSystemMonitor_BasicStateTransitions"
          "TestSystemMonitor_RepeatedCalls"
          "TestSystemMonitor_UnexpectedTransitions"
          "TestSystemMonitor_FullCycle"
        ];
      in
      [ "-skip=^${lib.concatStringsSep "$|^" skippedTests}$" ];
    meta.mainProgram = "wandb-core";
  };
in

buildPythonPackage (finalAttrs: {
  pname = "wandb";
  pyproject = true;

  inherit src version;

  postPatch =
    # Prevent hatch from building wandb-core and arrow-rs-wrapper
    ''
      substituteInPlace hatch_build.py \
        --replace-fail "artifacts.extend(self._build_wandb_core())" "" \
        --replace-fail "artifacts.extend(self._build_arrow_rs_wrapper())" ""
    ''
    # Hard-code the path to the `wandb-core` binary in the code.
    + ''
      substituteInPlace wandb/util.py \
        --replace-fail \
          'bin_path = pathlib.Path(__file__).parent / "bin" / "wandb-core"' \
          'bin_path = pathlib.Path("${lib.getExe wandb-core}")'
    ''
    # Hard-code the path to git in the python code
    + ''
      substituteInPlace wandb/cli/cli.py \
        --replace-fail \
          '["git", "apply",' \
          '["${lib.getExe gitMinimal}", "apply",' \
    '';

  env = {
    # Prevent the install script from trying to build and embed native binaries in the wheel.
    # Their paths have been patched accordingly in the `wandb-core` and `wandb` source codes.
    # https://github.com/wandb/wandb/blob/v0.18.5/hatch_build.py#L37-L47
    WANDB_BUILD_SKIP_WANDB_XPU = true;
    WANDB_BUILD_SKIP_ORJSON = true;
    WANDB_BUILD_UNIVERSAL = true;
  };

  build-system = [
    hatchling
  ];

  dependencies = [
    click
    packaging
    platformdirs
    protobuf
    pydantic
    pyyaml
    requests
    sentry-sdk
    setproctitle
  ]
  ++ lib.optionals (pythonOlder "3.12") [
    typing-extensions
  ];
  # test_matplotlib_image_with_multiple_axes may take >60s
  passthru = {
    inherit
      wandb-core
      wandb-xpu
      parquet-rust-wrapper
      ;
  };

  meta = {
    description = "CLI and library for interacting with the Weights and Biases API";
    homepage = "https://github.com/wandb/wandb";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "wandb";
    broken = wandb-xpu.meta.broken || wandb-core.meta.broken;
  };
})

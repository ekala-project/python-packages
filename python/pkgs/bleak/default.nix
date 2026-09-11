{
  lib,
  stdenv,
  bluez,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  bumble,
  dbus-fast,
  pyobjc-core ? null,
  pyobjc-framework-CoreBluetooth ? null,
  pyobjc-framework-libdispatch ? null,
  pytest-asyncio,
  pytest-cov-stub,
}:

buildPythonPackage (finalAttrs: {
  pname = "bleak";
  version = "3.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "hbldh";
    repo = "bleak";
    tag = "v${finalAttrs.version}";
    hash = "sha256-I+nN3/KKF0PC9TO8SULXX1oOGUokYa2tlPVfEJ/0mbY=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'requires = ["uv_build>=0.10.9,<0.11.0"]' 'requires = ["setuptools"]' \
      --replace-fail 'build-backend = "uv_build"' 'build-backend = "setuptools.build_meta"' \
      --replace-fail "ignore:Couldn't import C tracer:coverage.exceptions.CoverageWarning" ""
  ''
  # bleak checks BlueZ's version with a call to `bluetoothctl --version`
  + lib.optionalString stdenv.hostPlatform.isLinux ''
    substituteInPlace bleak/backends/bluezdbus/version.py \
      --replace-fail \
        '"bluetoothctl"' \
        '"${lib.getExe' bluez "bluetoothctl"}"'
  '';

  build-system = [ setuptools ];

  dependencies = [
  ]
  ++ lib.optionals stdenv.hostPlatform.isLinux [
    dbus-fast
  ]
  ++ lib.optionals stdenv.hostPlatform.isDarwin [
    pyobjc-core
    pyobjc-framework-CoreBluetooth
    pyobjc-framework-libdispatch
  ];
  pythonImportsCheck = [ "bleak" ];

  meta = {
    description = "Bluetooth Low Energy platform agnostic client";
    homepage = "https://github.com/hbldh/bleak";
    license = lib.licenses.mit;
    platforms = lib.platforms.linux ++ lib.platforms.darwin;
    maintainers = [ ];
  };
})

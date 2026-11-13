{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  fetchpatch,

  # build-system, dependencies
  meson,
  ninja,
  pyproject-metadata,
}:

buildPythonPackage (finalAttrs: {
  pname = "meson-python";
  version = "0.22.1";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) version;
    pname = "meson_python";
    hash = "sha256-UsiGKLDlZxWS3CMGYT+19vNhX9JN7wWbmJTxQ7f5oTk=";
  };

  build-system = [
    meson
    ninja
    pyproject-metadata
  ];

  dependencies = [
    meson
    ninja
    pyproject-metadata
  ];
  dontUseCmakeConfigure = true;

  # meson-python respectes MACOSX_DEPLOYMENT_TARGET, but compares it with the
  # actual platform version during tests, which mismatches.
  # https://github.com/mesonbuild/meson-python/issues/760
  # FIXME: drop in 0.19.0
  preCheck =
    if stdenv.hostPlatform.isDarwin then
      ''
        unset MACOSX_DEPLOYMENT_TARGET
      ''
    else
      null;

  setupHooks = [ ./add-build-flags.sh ];

  meta = {
    description = "Meson Python build backend (PEP 517)";
    homepage = "https://github.com/mesonbuild/meson-python";
    license = lib.licenses.mit;
  };
})

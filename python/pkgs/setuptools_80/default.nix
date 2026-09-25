{
  stdenv,
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  python,
}:

buildPythonPackage (finalAttrs: {
  pname = "setuptools";
  version = "80.10.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pypa";
    repo = "setuptools";
    tag = "v${finalAttrs.version}";
    hash = "sha256-kf2c4auQrZDGW8bM0SxOPFsR8IE4b0coevTxKWGtHp8=";
  };

  # Drop dependency on coherent.license, which in turn requires coherent.build
  postPatch = ''
    sed -i "/coherent.licensed/d" pyproject.toml

    # Hardcode version for reproducible builds (v80 doesn't have the noqa comment
    # that the shared reproducible-wheel.patch expects)
    cat > setuptools/version.py <<EOF
    # Hardcoded for reproducible builds
    # This avoids runtime metadata queries that can vary between builds
    __version__ = '${finalAttrs.version}'
    EOF
  '';

  preBuild = lib.optionalString (!stdenv.hostPlatform.isWindows) ''
    export SETUPTOOLS_INSTALL_WINDOWS_SPECIFIC_FILES=0
  '';

  # Requires pytest, causing infinite recursion.
  doCheck = false;

  meta = {
    description = "Utilities to facilitate the installation of Python packages";
    homepage = "https://github.com/pypa/setuptools";
    license = lib.licenses.mit;
    platforms = python.meta.platforms;
  };
})

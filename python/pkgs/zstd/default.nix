{
  lib,
  buildPythonPackage,
  buildPackages,
  fetchPypi,
  # build-system
  setuptools,
  pkg-config,
  pkgs,
}:

buildPythonPackage (finalAttrs: {
  pname = "zstd";
  version = "1.5.7.3";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-QD5SBfSsBLkuawzaZUvi9R3iaCKKDbAGe8CH+qzy9JU=";
  };

  build-system = [ setuptools ];

  postPatch = ''
    substituteInPlace setup.py \
      --replace "/usr/bin/pkg-config" "${buildPackages.pkg-config}/bin/${buildPackages.pkg-config.targetPrefix}pkg-config"
  '';

  nativeBuildInputs = [ pkg-config ];
  buildInputs = [ pkgs.zstd ];

  setupPyBuildFlags = [
    "--external"
    "--include-dirs=${pkgs.zstd}/include"
    "--libraries=zstd"
    "--library-dirs=${pkgs.zstd}/lib"
  ];

  env = {
    ZSTD_EXTERNAL = 1;
    VERSION = pkgs.zstd.version;
    PKG_VERSION = finalAttrs.version;
  };

  pythonImportsCheck = [ "zstd" ];

  meta = {
    description = "Simple python bindings to Yann Collet ZSTD compression library";
    homepage = "https://github.com/sergey-dryabzhinsky/python-zstd";
    license = lib.licenses.bsd2;
  };
})

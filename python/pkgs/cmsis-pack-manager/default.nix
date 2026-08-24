{ lib
, fetchFromGitHub
, rustPlatform
, cffi
, libiconv
, buildPythonPackage
, appdirs
, pyyaml
,
}:

buildPythonPackage rec {
  pname = "cmsis-pack-manager";
  version = "0.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pyocd";
    repo = "cmsis-pack-manager";
    tag = "v${version}";
    hash = "sha256-kb0VSg89qglL6Q5kx1nEN1OW1GYoccBTITtPw2/dXTY=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit src;
    hash = "sha256-yRNSFlEwFhfkSNjbFHipVZvJZ40pKbI9HhLtciws7nc=";
  };

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
  ];
  propagatedNativeBuildInputs = [ cffi ];
  buildInputs = [
    libiconv
  ];
  propagatedBuildInputs = [
    appdirs
    pyyaml
  ];
  # remove cmsis_pack_manager source directory so that binaries can be imported
  # from the installed wheel instead
  meta = {
    description = "Rust and Python module for handling CMSIS Pack files";
    homepage = "https://github.com/pyocd/cmsis-pack-manager";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}

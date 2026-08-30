{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  rustPlatform,
}:

buildPythonPackage (finalAttrs: {
  pname = "cramjam";
  version = "2.12.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "milesgranger";
    repo = "cramjam";
    tag = "v${finalAttrs.version}";
    hash = "sha256-Sjb1YBFJ26or4RiTA1G0UmVD6tyi9hNwBrde7E/WOes=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) pname src version;
    hash = "sha256-evXYLbv+GwSBUJBb0upjQTFtMPdQbKka8KfJltMUmDs=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail 'version = "2.12.0-rc1"' 'version = "${finalAttrs.version}"'
  '';

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
    rustPlatform.maturinBuildHook
  ];

  pythonImportsCheck = [ "cramjam" ];

  meta = {
    description = "Thin Python bindings to de/compression algorithms in Rust";
    homepage = "https://github.com/milesgranger/pyrus-cramjam";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})

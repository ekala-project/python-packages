{
  lib,
  buildPythonPackage,
  cargo,
  fastimport,
  fetchFromGitHub,
  gnupg,
  gpg,
  merge3,
  paramiko,
  rich,
  rustPlatform,
  rustc,
  setuptools,
  setuptools-rust,
  urllib3,
}:

buildPythonPackage (finalAttrs: {
  pname = "dulwich";
  version = "1.2.10";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jelmer";
    repo = "dulwich";
    tag = "dulwich-${finalAttrs.version}";
    hash = "sha256-ogYR4xK4sYbh7zOozpiZ+bubA6/kDx1iFkbIAjYLkIs=";
  };

  cargoDeps = rustPlatform.fetchCargoVendor {
    inherit (finalAttrs) pname version src;
    hash = "sha256-Shu80kj4rir3JvrgXmO82/Z6ZROaACl43zQBzjlDFYc=";
  };

  nativeBuildInputs = [
    rustPlatform.cargoSetupHook
    cargo
    rustc
  ];

  build-system = [
    setuptools
    setuptools-rust
  ];

  dependencies = [
    urllib3
  ];

  optional-dependencies = {
    colordiff = [ rich ];
    fastimport = [ fastimport ];
    https = [ urllib3 ];
    merge = [ merge3 ];
    pgp = [
      gpg
      gnupg
    ];
    paramiko = [ paramiko ];
  };

  pythonImportsCheck = [ "dulwich" ];

  meta = {
    description = "Implementation of the Git file formats and protocols";
    homepage = "https://www.dulwich.io/";
    license = with lib.licenses; [
      asl20
      gpl2Plus
    ];
    maintainers = [ ];
  };
})

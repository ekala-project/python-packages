{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  pdm-backend,
  httpx,
  zstandard,
}:

buildPythonPackage (finalAttrs: {
  pname = "pbs-installer";
  version = "2026.09.01";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "frostming";
    repo = "pbs-installer";
    tag = finalAttrs.version;
    hash = "sha256-DmS0RThERXTCufIX4oAG3qfxzs324Ol2oeqN+iKiNfs=";
  };

  build-system = [ pdm-backend ];

  optional-dependencies = {
    all = finalAttrs.optional-dependencies.install ++ finalAttrs.optional-dependencies.download;
    download = [ httpx ];
    install = [ zstandard ];
  };

  pythonImportsCheck = [ "pbs_installer" ];

  # upstream has no test

  meta = {
    description = "Installer for Python Build Standalone";
    homepage = "https://github.com/frostming/pbs-installer";
    license = lib.licenses.mit;
  };
})

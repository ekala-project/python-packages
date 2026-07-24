{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  nix-update-script,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "pybase62";
  version = "1.0.0";
  pyproject = true;

  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "suminb";
    repo = "base62";
    tag = "v${finalAttrs.version}";
    hash = "sha256-7N/SGJAVwJOy1ObijA2s9XMrqMMb2SUMJaN72ITUrOM=";
  };

  build-system = [ setuptools ];
  pythonImportsCheck = [ "base62" ];

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Module for base62 encoding";
    homepage = "https://github.com/suminb/base62";
    license = lib.licenses.bsd2WithViews;
    maintainers = [ ];
  };
})

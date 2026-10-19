{
  lib,
  aiohttp,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "aionanoleaf";
  version = "0.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "milanmeu";
    repo = "aionanoleaf";
    tag = "v${finalAttrs.version}";
    hash = "sha256-f0TyXhuAzI0s0n6sXH9mKWA4nad2YchZkQ0+jw/Bmv0=";
  };

  build-system = [ setuptools ];

  dependencies = [ aiohttp ];

  # Project has no tests

  pythonImportsCheck = [ "aionanoleaf" ];

  meta = {
    description = "Python wrapper for the Nanoleaf API";
    homepage = "https://github.com/milanmeu/aionanoleaf";
    license = lib.licenses.lgpl3Plus;
  };
})

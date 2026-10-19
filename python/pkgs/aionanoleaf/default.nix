{
  lib,
  aiohttp,
  buildPythonPackage,
  fetchFromGitHub,
}:

buildPythonPackage rec {
  pname = "aionanoleaf";
  version = "0.2.1";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "milanmeu";
    repo = "aionanoleaf";
    tag = "v${version}";
    hash = "sha256-f0TyXhuAzI0s0n6sXH9mKWA4nad2YchZkQ0+jw/Bmv0=";
  };

  dependencies = [ aiohttp ];

  # Project has no tests

  pythonImportsCheck = [ "aionanoleaf" ];

  meta = {
    description = "Python wrapper for the Nanoleaf API";
    homepage = "https://github.com/milanmeu/aionanoleaf";
    license = lib.licenses.lgpl3Plus;
  };
}

{
  lib,
  aiohttp,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "mbddns";
  version = "0.1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "thinkl33t";
    repo = "mb-ddns";
    tag = finalAttrs.version;
    sha256 = "13xzkprqk1v0zlzx4a0n9zzpnlb1g2h6pc62ms66fj72lsmjynj7";
  };

  build-system = [ setuptools ];

  dependencies = [ aiohttp ];

  # Project has no tests

  pythonImportsCheck = [ "mbddns" ];

  meta = {
    description = "Mythic Beasts Dynamic DNS updater";
    homepage = "https://github.com/thinkl33t/mb-ddns";
    license = lib.licenses.mit;
  };
})

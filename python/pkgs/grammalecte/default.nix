{
  lib,
  buildPythonPackage,
  fetchurl,
  # build-system
  setuptools,
  bottle,
  isPy3k,
}:

buildPythonPackage (finalAttrs: {
  pname = "grammalecte";
  version = "2.1.1";
  pyproject = true;

  src = fetchurl {
    url = "https://grammalecte.net/grammalecte/zip/Grammalecte-fr-v${finalAttrs.version}.zip";
    sha256 = "076jv3ywdgqqzg92bfbagc7ypy08xjq5zn4vgna6j9350fkfqhzn";
  };

  build-system = [ setuptools ];

  patchPhase = ''
    runHook prePatch
    substituteInPlace grammalecte-server.py --replace sys.version_info.major sys.version_info
    runHook postPatch
  '';

  dependencies = [ bottle ];

  sourceRoot = ".";

  disabled = !isPy3k;

  meta = {
    description = "Open source grammar and typographic corrector for the French language";
    homepage = "https://grammalecte.net";
    license = lib.licenses.gpl3Only;
  };
})

{
  lib,
  buildPythonPackage,
  fetchFromCodeberg,
  nix-update-script,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "inflate64";
  version = "1.0.2";
  pyproject = true;

  src = fetchFromCodeberg {
    owner = "miurahr";
    repo = "inflate64";
    tag = "v${version}";
    hash = "sha256-qYTkL37IzvrhYYwj6i6X8WRSQxprNKgBnQEYRnztzjA=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];
  pythonImportsCheck = [
    "inflate64"
  ];

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Compress and decompress with Enhanced Deflate compression algorithm";
    homepage = "https://codeberg.org/miurahr/inflate64";
    license = lib.licenses.gpl2Plus;
    maintainers = [ ];
  };

}

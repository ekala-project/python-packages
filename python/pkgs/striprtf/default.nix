{
  lib,
  buildPythonPackage,
  fetchPypi,
  hatchling,
}:

buildPythonPackage (finalAttrs: {
  pname = "striprtf";
  version = "0.0.35";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-oh6MT3OnkcPyNWHflnAUiMaRqxdJqSSHzJ5f7m6ghFU=";
  };

  # Upper bound only exists to keep Metadata-Version <= 2.4 for PyPI uploads
  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"hatchling>=1.21.0,<1.32"' '"hatchling>=1.21.0"'
  '';

  build-system = [ hatchling ];

  pythonImportsCheck = [ "striprtf" ];

  meta = {
    description = "Simple library to convert rtf to text";
    homepage = "https://github.com/joshy/striprtf";
    license = lib.licenses.bsd3;
  };
})

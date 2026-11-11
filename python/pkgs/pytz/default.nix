{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  pkgs,
}:

buildPythonPackage (finalAttrs: {
  pname = "pytz";
  version = "2026.6";
  pyproject = true;

  src = fetchPypi {
    inherit (finalAttrs) pname version;
    hash = "sha256-Ow/CcncHZj1uUXk29ET9ioskDx/DL0v37gMnQkWUUoQ=";
  };

  postPatch = ''
    # Use our system-wide zoneinfo dir instead of the bundled one
    rm -rf pytz/zoneinfo
    ln -snvf ${pkgs.tzdata}/share/zoneinfo pytz/zoneinfo
  '';

  build-system = [ setuptools ];

  pythonImportsCheck = [ "pytz" ];

  meta = {
    description = "World timezone definitions, modern and historical";
    homepage = "https://pythonhosted.org/pytz";
    license = lib.licenses.mit;
  };
})

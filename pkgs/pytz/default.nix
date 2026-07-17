{
  lib,
  fetchPypi,
  buildPythonPackage,
  setuptools,
  pkgs,
}:

buildPythonPackage rec {
  pname = "pytz";
  version = "2026.2";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-DmC0eynyFXQ3byGP4hq8AJiUojIeoWxnVPPK1ut83Wo=";
  };

  postPatch = ''
    # Use our system-wide zoneinfo dir instead of the bundled one
    rm -rf pytz/zoneinfo
    ln -snvf ${pkgs.tzdata}/share/zoneinfo pytz/zoneinfo
  '';

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "pytz" ];

  meta = {
    description = "World timezone definitions, modern and historical";
    homepage = "https://pythonhosted.org/pytz";
    license = lib.licenses.mit;
  };
}

{
  lib,
  buildPythonPackage,
  fetchPypi,

  # build-system
  setuptools,
}:

buildPythonPackage rec {
  pname = "zc-lockfile";
  version = "4.0";
  pyproject = true;

  src = fetchPypi {
    pname = "zc_lockfile";
    inherit version;
    hash = "sha256-06sPU5dClqgG2zIZuRkboObVy70dqi4NFyCMubKdIQI=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools ==" "setuptools >="
  '';

  build-system = [ setuptools ];

  pythonNamespaces = [ "zc" ];

  pythonImportsCheck = [ "zc.lockfile" ];

  meta = {
    homepage = "https://github.com/zopefoundation/zc.lockfile";
    description = "Inter-process locks";
    license = lib.licenses.zpl21;
  };
}

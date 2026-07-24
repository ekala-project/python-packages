{
  lib,
  stdenv,
  buildPythonPackage,
  fetchPypi,
  cachelib,
  flask,
  asgiref,
  pytest-asyncio,
  pytest-xprocess,
}:

buildPythonPackage rec {
  pname = "flask-caching";
  version = "2.3.1";
  format = "setuptools";

  src = fetchPypi {
    pname = "flask_caching";
    inherit version;
    hash = "sha256-Zdf9G07r+BD4RN595iWCVLMkgpbuQpvcs/dBvL97mMk=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace "cachelib >= 0.9.0, < 0.10.0" "cachelib"
  '';

  propagatedBuildInputs = [
    cachelib
    flask
  ];
  meta = {
    description = "Caching extension for Flask";
    homepage = "https://github.com/pallets-eco/flask-caching";
    maintainers = [ ];
    license = lib.licenses.bsd3;
  };
}

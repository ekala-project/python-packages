{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "exrex";
  version = "0.11.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "asciimoo";
    repo = "exrex";
    rev = "239e4da37ff3a66d8b4b398d189299ae295594c3";
    hash = "sha256-Tn/XIIy2wnob+1FmP9bdD9+gHLQZDofF2c1FqOijKWA=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace "version=about['__version__']," "version='${version}',"
  '';

  build-system = [ setuptools ];

  doCheck = false;

  pythonImportsCheck = [ "exrex" ];

  meta = {
    description = "Irregular methods on regular expressions";
    homepage = "https://github.com/asciimoo/exrex";
    license = lib.licenses.agpl3Plus;
  };
}

{
  lib,
  buildPythonPackage,
  fetchurl,
  setuptools,
}:

let
  sqliteVersion = "3530400";
  sqliteAmalgamation = fetchurl {
    url = "https://sqlite.org/2026/sqlite-autoconf-${sqliteVersion}.tar.gz";
    hash = "sha256-DpSDkA6SzV3o/UjRa/kgAUWmH3/VvlQqWsgdipUW65w=";
  };
in

buildPythonPackage rec {
  pname = "apsw";
  version = "3.53.4.0";
  pyproject = true;

  # https://github.com/rogerbinns/apsw/issues/548
  src = fetchurl {
    url = "https://github.com/rogerbinns/apsw/releases/download/${version}/apsw-${version}.tar.gz";
    hash = "sha256-zVn2szMJS6zYArXleW8Xn1/WE2T5HniAdBGbXsZtxGs=";
  };

  # apsw 3.53.4.0 requires SQLite 3.53 which is newer than nixpkgs sqlite;
  # use the amalgamation so apsw statically compiles the matching SQLite
  postPatch = ''
    tar xf ${sqliteAmalgamation} --strip-components=1 -C . sqlite-autoconf-${sqliteVersion}/sqlite3.c sqlite-autoconf-${sqliteVersion}/sqlite3.h
  '';

  build-system = [ setuptools ];

  # apsw explicitly doesn't use pytest
  # see https://github.com/rogerbinns/apsw/issues/548#issuecomment-2891633403
  checkPhase = ''
    runHook preCheck
    python -m apsw.tests
    runHook postCheck
  '';

  pythonImportsCheck = [ "apsw" ];

  meta = {
    description = "Python wrapper for the SQLite embedded relational database engine";
    homepage = "https://github.com/rogerbinns/apsw";
    license = lib.licenses.zlib;
    maintainers = [ ];
  };
}

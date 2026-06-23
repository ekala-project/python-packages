{
  stdenv,
  lib,
  buildPythonPackage,
  isPyPy,
  fetchPypi,
  libpq,
  openssl,
  sphinxHook,
  sphinx-better-theme,
  buildPackages,
  setuptools,
}:

buildPythonPackage rec {
  pname = "psycopg2";
  version = "2.9.11";
  pyproject = true;

  # Extension modules don't work well with PyPy. Use psycopg2cffi instead.
  # c.f. https://github.com/NixOS/nixpkgs/pull/104151#issuecomment-729750892
  disabled = isPyPy;

  outputs = [
    "out"
    "doc"
  ];

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-lk0xyvco4hfGl/936mnCughl+kHsILsA8Jd+Yv3MUuM=";
  };

  postPatch = ''
    substituteInPlace setup.py \
      --replace-fail "self.pg_config_exe = self.build_ext.pg_config" 'self.pg_config_exe = "${libpq.pg_config}/bin/pg_config"'
  '';

  nativeBuildInputs = [
    sphinxHook
    sphinx-better-theme
  ];

  build-system = [
    setuptools
  ];

  buildInputs = [ libpq ] ++ lib.optionals stdenv.hostPlatform.isDarwin [ openssl ];

  sphinxRoot = "doc/src";

  doCheck = false;

  pythonImportsCheck = [ "psycopg2" ];

  disallowedReferences = lib.optionals (stdenv.buildPlatform != stdenv.hostPlatform) [
    buildPackages.libpq
  ];

  meta = {
    description = "PostgreSQL database adapter for the Python programming language";
    homepage = "https://www.psycopg.org";
    license = with lib.licenses; [
      lgpl3Plus
      zpl20
    ];
  };
}

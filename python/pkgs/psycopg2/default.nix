{
  stdenv,
  lib,
  buildPythonPackage,
  isPyPy,
  fetchPypi,
  libpq,
  openssl,
  buildPackages,
  setuptools,
  writeShellScript,
}:

buildPythonPackage rec {
  pname = "psycopg2";
  version = "2.9.12";
  pyproject = true;

  # Extension modules don't work well with PyPy. Use psycopg2cffi instead.
  # c.f. https://github.com/NixOS/nixpkgs/pull/104151#issuecomment-729750892
  disabled = isPyPy;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-He2xx6HYVSxKYETGscQaUuao4tFEr4PsysdYB2sbfBU=";
  };

  postPatch =
    let
      pg_config = writeShellScript "pg_config" ''
        case "$1" in
          --libdir)     echo "${lib.getLib libpq}/lib" ;;
          --includedir) echo "${lib.getDev libpq}/include" ;;
          --includedir-server) echo "${lib.getDev libpq}/include" ;;
          --pkgincludedir) echo "${lib.getDev libpq}/include" ;;
          --version)    echo "PostgreSQL ${libpq.version}" ;;
          --ldflags)    echo "-L${lib.getLib libpq}/lib" ;;
          --cflags)     echo "-I${lib.getDev libpq}/include" ;;
          --cflags_sl)  echo "-fPIC" ;;
          *)            echo "" ;;
        esac
      '';
    in
    ''
      # Preferably upstream would not depend on pg_config because config scripts are incompatible with cross-compilation, however postgresql's pc file is lacking information.
      # some linker flags are added but the linker ignores them because they're incompatible
      # https://github.com/psycopg/psycopg2/blob/89005ac5b849c6428c05660b23c5a266c96e677d/setup.py
      substituteInPlace setup.py \
        --replace-fail "self.pg_config_exe = self.build_ext.pg_config" 'self.pg_config_exe = "${pg_config}"'
    '';

  build-system = [
    setuptools
  ];

  buildInputs = [ libpq ] ++ lib.optionals stdenv.hostPlatform.isDarwin [ openssl ];

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
    maintainers = [ ];
  };
}

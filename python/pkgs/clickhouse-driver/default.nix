{
  lib,
  buildPythonPackage,
  clickhouse-cityhash,
  cython,
  fetchFromGitHub,
  lz4,
  pytz,
  setuptools,
  tzlocal,
  zstd,
}:

buildPythonPackage (finalAttrs: {
  pname = "clickhouse-driver";
  version = "0.2.10";
  pyproject = true;

  __structuredAttrs = true;

  # pypi source doesn't contain tests
  src = fetchFromGitHub {
    owner = "mymarilyn";
    repo = "clickhouse-driver";
    tag = finalAttrs.version;
    hash = "sha256-veFkmXAp8b6/Npt7f1EhMfM9OKlLugKtlXS+zMHWAro=";
  };

  build-system = [
    setuptools
  ];

  nativeBuildInputs = [
    cython
  ];

  dependencies = [
    clickhouse-cityhash
    lz4
    pytz
    tzlocal
    zstd
  ];
  postPatch = ''
    substituteInPlace setup.py \
      --replace-fail "lz4<=3.0.1" "lz4<=4"
  '';

  # remove source to prevent pytest testing source instead of the build artifacts
  # (the source doesn't contain the extension modules)
  # some test in test_buffered_reader.py doesn't seem to return
  # most tests require `clickhouse`
  # TODO: enable tests after `clickhouse` unbroken
  doCheck = false;

  pythonImportsCheck = [ "clickhouse_driver" ];

  meta = {
    description = "Python driver with native interface for ClickHouse";
    homepage = "https://github.com/mymarilyn/clickhouse-driver";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})

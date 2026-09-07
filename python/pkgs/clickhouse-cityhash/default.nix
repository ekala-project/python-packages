{
  lib,
  buildPythonPackage,
  cython,
  fetchPypi,
  fetchpatch,
  setuptools,
}:

buildPythonPackage rec {
  pname = "clickhouse-cityhash";
  version = "1.0.2.6";
  pyproject = true;

  src = fetchPypi {
    inherit version;
    pname = "clickhouse_cityhash";
    hash = "sha256-Yq9sraxmVWE3cGZKsmgCjlyLcvyXgrMMD12HJK9Sx78=";
  };

  nativeBuildInputs = [
    cython
    setuptools
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "Cython>=3.0,<3.1" "Cython>=3.0"
  '';

  doCheck = false;

  pythonImportsCheck = [ "clickhouse_cityhash" ];

  meta = {
    description = "Python-bindings for CityHash, a fast non-cryptographic hash algorithm";
    homepage = "https://github.com/xzkostyan/python-cityhash";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

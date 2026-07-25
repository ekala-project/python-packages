{
  lib,
  stdenv,
  fetchFromGitHub,
  fetchpatch,
  buildPythonPackage,
  pythonOlder,

  # build-system
  setuptools,

  # optional-dependencies
  cryptography,
  libvalkey,
  pyopenssl,
  requests,
}:

buildPythonPackage rec {
  pname = "valkey";
  version = "6.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "valkey-io";
    repo = "valkey-py";
    tag = "v${version}";
    hash = "sha256-woJYfgLNIVzTYj9q8IjXo+SXhQZkQdB/Ofv5StGy9Rc=";
  };

  patches = [
    # valkey 9.0 compat
    (fetchpatch {
      url = "https://github.com/valkey-io/valkey-py/commit/c01505e547f614f278b882a016557b6ed652bb9f.patch";
      hash = "sha256-rvA65inIioqdc+QV4KaaUv1I/TMZUq0TWaFJcJiy8NU=";
    })
    # valkey 9.1 compat
    (fetchpatch {
      url = "https://github.com/valkey-io/valkey-py/commit/df5c44903dc8e2dda733e5576324ba0ff8c4c6a0.patch";
      hash = "sha256-0wsWuaOYWBgf6BjlJuciZYRbugYfchTU2khQX7rtRJg=";
    })
    (fetchpatch {
      url = "https://github.com/valkey-io/valkey-py/commit/046c7fb9e8260c2d69d05141b1519903c4e40efe.patch";
      hash = "sha256-/yN1y0hbmBR6o6ab4h0qkn/qhU6jASOIeqWhxUi5w/I=";
    })
  ];

  build-system = [ setuptools ];

  optional-dependencies = {
    libvalkey = [ libvalkey ];
    ocsp = [
      cryptography
      pyopenssl
      requests
    ];
  };

  pythonImportsCheck = [
    "valkey"
    "valkey.client"
    "valkey.cluster"
    "valkey.connection"
    "valkey.exceptions"
    "valkey.sentinel"
    "valkey.utils"
  ];
  disabledTestPaths = lib.optionals stdenv.hostPlatform.isDarwin [
    # AttributeError: Can't get local object 'TestMultiprocessing.test_valkey_client.<locals>.target'
    "tests/test_multiprocessing.py"
  ];
  meta = {
    description = "Python client for Redis key-value store";
    homepage = "https://github.com/valkey-io/valkey-py";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

{
  lib,
  stdenv,
  buildPythonPackage,
  cryptography,
  cython,
  deprecated,
  eventlet,
  fetchFromGitHub,
  geomet,
  gevent,
  gremlinpython,
  iana-etc,
  libev,
  libredirect,
  pytz,
  pyyaml,
  scales,
  sure,
  tomli,
  twisted,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "cassandra-driver";
  version = "3.30.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "apache";
    repo = "cassandra-python-driver";
    tag = finalAttrs.version;
    hash = "sha256-4ElOiADaldT/TyLqg/5ijFk9Ygb3GEF37P2d8WdAxkw=";
  };

  pythonRelaxDeps = [ "geomet" ];

  build-system = [
    setuptools
    cython
    tomli
  ];

  buildInputs = [ libev ];

  dependencies = [
    deprecated
    geomet
  ];

  optional-dependencies = {
    cle = [ cryptography ];
    eventlet = [ eventlet ];
    gevent = [ gevent ];
    graph = [ gremlinpython ];
    metrics = [ scales ];
    twisted = [ twisted ];
  };
  postCheck = ''
    unset NIX_REDIRECTS LD_PRELOAD
  '';
  meta = {
    description = "Python client driver for Apache Cassandra";
    homepage = "https://github.com/apache/cassandra-python-driver";
    license = lib.licenses.asl20;
  };
})

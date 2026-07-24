{
  lib,
  asgiref,
  buildPythonPackage,
  fetchFromGitHub,
  flask,
  hatchling,
  hatch-vcs,
  hiro,
  limits,
  ordered-set,
  pymemcache,
  pymongo,
  pytest-check,
  pytest-cov-stub,
  pytest-mock,
  redis,
  rich,
}:

buildPythonPackage rec {
  pname = "flask-limiter";
  version = "4.1.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "alisaifee";
    repo = "flask-limiter";
    tag = version;
    hash = "sha256-lrq4WCc2gxm039nXW6tiDt7laJFEICO0x9jw71UUwaI=";
  };

  postPatch = ''
    # flask-restful is unmaintained and breaks regularly, don't depend on it
    substituteInPlace tests/test_views.py \
      --replace-fail "import flask_restful" ""
  '';

  build-system = [
    hatchling
    hatch-vcs
  ];

  dependencies = [
    flask
    limits
    ordered-set
  ];

  optional-dependencies = {
    cli = [ rich ];
    redis = limits.optional-dependencies.redis;
    memcached = limits.optional-dependencies.memcached;
    mongodb = limits.optional-dependencies.mongodb;
  };
  pythonImportsCheck = [ "flask_limiter" ];

  meta = {
    description = "Rate limiting for flask applications";
    homepage = "https://flask-limiter.readthedocs.org/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

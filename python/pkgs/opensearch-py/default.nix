{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  certifi,
  events,
  python-dateutil,
  requests,
  six,
  urllib3,

  # optional-dependencies
  aiohttp,
}:

buildPythonPackage (finalAttrs: {
  pname = "opensearch-py";
  version = "3.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "opensearch-project";
    repo = "opensearch-py";
    tag = "v${finalAttrs.version}";
    hash = "sha256-IAEh+rB26Zqv7j5g2YIRZRCAtFbBngoh+w8Z4e2bY+M=";
  };

  nativeBuildInputs = [ setuptools ];

  dependencies = [
    certifi
    events
    python-dateutil
    requests
    six
    urllib3
  ];

  optional-dependencies.async = [ aiohttp ];

  meta = {
    description = "Python low-level client for OpenSearch";
    homepage = "https://github.com/opensearch-project/opensearch-py";
    license = lib.licenses.asl20;
  };
})

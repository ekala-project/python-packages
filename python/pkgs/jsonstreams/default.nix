{
  stdenv,
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  pytestCheckHook,
  six,
}:

buildPythonPackage (finalAttrs: {
  pname = "jsonstreams";
  version = "0.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dcbaker";
    repo = "jsonstreams";
    tag = finalAttrs.version;
    sha256 = "0qw74wz9ngz9wiv89vmilbifsbvgs457yn1bxnzhrh7g4vs2wcav";
  };

  build-system = [ setuptools ];

  dependencies = [ six ];

  nativeCheckInputs = [ pytestCheckHook ];

  pytestFlags = [ "--doctest-modules" ];

  enabledTestPaths = [
    "tests"
    "jsonstreams"
  ];

  meta = {
    broken = stdenv.hostPlatform.isDarwin;
    description = "JSON streaming writer";
    homepage = "https://github.com/dcbaker/jsonstreams";
    license = lib.licenses.mit;
  };
})

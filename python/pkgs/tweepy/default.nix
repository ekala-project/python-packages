{
  lib,
  aiohttp,
  async-lru,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  oauthlib,
  requests-oauthlib,
  requests,
  vcrpy,
}:

buildPythonPackage rec {
  pname = "tweepy";
  version = "4.17.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "tweepy";
    repo = "tweepy";
    tag = "v${version}";
    hash = "sha256-Jr/62vXxBIiZGQeM5bbqnHDP9GCxrbJmCF2oiYglLbE=";
  };

  build-system = [ flit-core ];

  dependencies = [
    oauthlib
    requests
    requests-oauthlib
  ];

  optional-dependencies = {
    async = [
      aiohttp
      async-lru
    ];
  };
  # The checks with streaming fail due to (seemingly) not decoding (or unexpectedly sending response in) GZIP
  # Same issue impacted mastodon-py, see https://github.com/halcy/Mastodon.py/commit/cd86887d88bbc07de462d1e00a8fbc3d956c0151 (who just disabled these)
  meta = {
    description = "Twitter library for Python";
    homepage = "https://github.com/tweepy/tweepy";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build
  hatchling,
  # runtime
  cassandra-driver,
  motor,
  numpy,
  pybloomfilter3,
  redis,
  scipy,
  # check
  aiounittest,
}:

buildPythonPackage (finalAttrs: {
  pname = "datasketch";
  version = "2.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ekzhu";
    repo = "datasketch";
    tag = "v${finalAttrs.version}";
    hash = "sha256-1t14DDgToYaGHslIpaeunzIIuxE5DSKwvpKXMQPt9+U=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "--cov-report=xml" ""
  '';

  build-system = [ hatchling ];

  dependencies = [
    numpy
    scipy
  ];

  optional-dependencies = rec {
    cassandra = [ cassandra-driver ];
    redis = [ redis ];
    experimental_aio = [
      motor
      aiounittest
    ];
    bloom = [ pybloomfilter3 ];
    all = cassandra ++ redis ++ experimental_aio ++ bloom;
  };
  meta = {
    description = "MinHash, LSH, LSH Forest, Weighted MinHash, HyperLogLog, HyperLogLog++, LSH Ensemble and HNSW";
    homepage = "https://ekzhu.com/datasketch/";
    license = lib.licenses.mit;
  };
})

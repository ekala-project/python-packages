{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  flit-core,

  # optional-dependencies
  jupyter,
  mediapy,
  numpy,
  packaging,
  protobuf,
  fsspec,
  typing-extensions,
  zipp,
  absl-py,
  simple-parsing,
  einops,
  gcsfs,
  s3fs,
  tqdm,
  dm-tree,
  jax,
}:

buildPythonPackage (finalAttrs: {
  pname = "etils";
  version = "1.14.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "google";
    repo = "etils";
    tag = "v${finalAttrs.version}";
    hash = "sha256-gjWA+y1dXihmOBzCxfgUZJLvtSHzpRLQIhNxzk+y11M=";
  };

  build-system = [ flit-core ];

  optional-dependencies = lib.fix (self: {
    array-types = self.enp;
    eapp = [
      absl-py
      simple-parsing
    ]
    ++ self.epy;
    ecolab = [
      jupyter
      numpy
      mediapy
      packaging
      protobuf
    ]
    ++ self.enp
    ++ self.epy
    ++ self.etree;
    edc = self.epy;
    enp = [
      numpy
      einops
    ]
    ++ self.epy;
    epath = [
      fsspec
      typing-extensions
      zipp
    ]
    ++ self.epy;
    epath-gcs = [ gcsfs ] ++ self.epath;
    epath-s3 = [ s3fs ] ++ self.epath;
    epy = [ typing-extensions ];
    etqdm = [
      absl-py
      tqdm
    ]
    ++ self.epy;
    etree = self.array-types ++ self.epy ++ self.enp ++ self.etqdm;
    etree-dm = [ dm-tree ] ++ self.etree;
    etree-jax = [ jax ] ++ self.etree;
  });

  pythonImportsCheck = [ "etils" ];

  meta = {
    description = "Collection of eclectic utils";
    homepage = "https://github.com/google/etils";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})

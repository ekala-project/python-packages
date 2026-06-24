{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,
  hatch-vcs,

  # optional-dependencies
  pyarrow ? null,
  requests,
  aiohttp,
  gcsfs,
  paramiko,
  s3fs,
  tqdm,
}:

buildPythonPackage rec {
  pname = "fsspec";
  version = "2026.3.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fsspec";
    repo = "filesystem_spec";
    tag = version;
    hash = "sha256-K/qHc9uBYq/HkA6xhKAujdCBqH+0kcFnfD3a506A9Ns=";
  };

  build-system = [
    hatchling
    hatch-vcs
  ];

  optional-dependencies = {
    arrow = lib.optionals (pyarrow != null) [ pyarrow ];
    entrypoints = [ ];
    full = [
      aiohttp
      gcsfs
      paramiko
      requests
      s3fs
      tqdm
    ] ++ lib.optionals (pyarrow != null) [ pyarrow ];
    gcs = [ gcsfs ];
    github = [ requests ];
    gs = [ gcsfs ];
    hdfs = lib.optionals (pyarrow != null) [ pyarrow ];
    http = [ aiohttp ];
    s3 = [ s3fs ];
    sftp = [ paramiko ];
    ssh = [ paramiko ];
    tqdm = [ tqdm ];
  };

  pythonImportsCheck = [ "fsspec" ];

  meta = {
    description = "Specification that Python filesystems should adhere to";
    homepage = "https://github.com/fsspec/filesystem_spec";
    license = lib.licenses.bsd3;
  };
}

{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  hatchling,
  hatch-vcs,

  # optional-dependencies
  adlfs,
  pyarrow,
  dask,
  distributed,
  requests,
  dropbox,
  aiohttp,
  fusepy,
  gcsfs,
  libarchive-c,
  ocifs,
  panel,
  paramiko,
  pygit2,
  s3fs,
  smbprotocol,
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
    abfs = [ adlfs ];
    adl = [ adlfs ];
    arrow = [ pyarrow ];
    dask = [
      dask
      distributed
    ];
    dropbox = [
      dropbox
      requests
    ];
    entrypoints = [ ];
    full = [
      adlfs
      aiohttp
      dask
      distributed
      dropbox
      fusepy
      gcsfs
      libarchive-c
      ocifs
      panel
      paramiko
      pyarrow
      pygit2
      requests
      s3fs
      smbprotocol
      tqdm
    ];
    fuse = [ fusepy ];
    gcs = [ gcsfs ];
    git = [ pygit2 ];
    github = [ requests ];
    gs = [ gcsfs ];
    gui = [ panel ];
    hdfs = [ pyarrow ];
    http = [ aiohttp ];
    libarchive = [ libarchive-c ];
    oci = [ ocifs ];
    s3 = [ s3fs ];
    sftp = [ paramiko ];
    smb = [ smbprotocol ];
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

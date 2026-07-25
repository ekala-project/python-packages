{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  ansicolors,
  click,
  entrypoints,
  nbclient,
  nbformat,
  pyyaml,
  requests,
  tenacity,
  tqdm,
  pythonAtLeast,
  aiohttp,

  # optional-dependencies
  azure-datalake-store,
  azure-identity,
  azure-storage-blob,
  gcsfs,
  pygithub,
  pyarrow,
  boto3,
}:

buildPythonPackage rec {
  pname = "papermill";
  version = "2.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "nteract";
    repo = "papermill";
    tag = version;
    hash = "sha256-NxC5+hRDdMCl/7ZIho5ml4hdENrgO+wzi87GRPeMv8Q=";
  };

  build-system = [ setuptools ];

  dependencies = [
    ansicolors
    click
    entrypoints
    nbclient
    nbformat
    pyyaml
    requests
    tenacity
    tqdm
  ]
  ++ lib.optionals (pythonAtLeast "3.12") [ aiohttp ];

  optional-dependencies = {
    azure = [
      azure-datalake-store
      azure-identity
      azure-storage-blob
    ];
    gcs = [ gcsfs ];
    github = [ pygithub ];
    hdfs = [ pyarrow ];
    s3 = [ boto3 ];
  };
  pythonImportsCheck = [ "papermill" ];
  meta = {
    description = "Parametrize and run Jupyter and interact with notebooks";
    homepage = "https://github.com/nteract/papermill";
    license = lib.licenses.bsd3;
    maintainers = [ ];
    mainProgram = "papermill";
  };
}

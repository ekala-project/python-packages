{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  flit-core,

  # optional-dependencies
  azure-storage-blob,
  azure-storage-file-datalake,
  google-cloud-storage,
  boto3,

  # tests
  azure-identity,
  psutil,
  pydantic,
  pytest-cases,
  pytest-cov-stub,
  pytest-xdist,
  python-dotenv,
  shortuuid,
  tenacity,
}:

buildPythonPackage rec {
  pname = "cloudpathlib";
  version = "0.24.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "drivendataorg";
    repo = "cloudpathlib";
    tag = "v${version}";
    hash = "sha256-MpCgK1JnQ/Etp0EyH5z6iknrQeJ4Wn6rwBw2EjgVAic=";
  };

  postPatch =
    # missing pytest-reportlog test dependency
    ''
      substituteInPlace pyproject.toml \
        --replace-fail "--report-log reportlog.jsonl" ""
    '';

  build-system = [ flit-core ];

  optional-dependencies = {
    all = optional-dependencies.azure ++ optional-dependencies.gs ++ optional-dependencies.s3;
    azure = [
      azure-storage-blob
      azure-storage-file-datalake
    ];
    gs = [ google-cloud-storage ];
    s3 = [ boto3 ];
  };

  pythonImportsCheck = [ "cloudpathlib" ];
  meta = {
    description = "Python pathlib-style classes for cloud storage services such as Amazon S3, Azure Blob Storage, and Google Cloud Storage";
    homepage = "https://github.com/drivendataorg/cloudpathlib";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

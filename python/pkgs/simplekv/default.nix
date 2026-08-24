{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  # optional dependencies
  azure-storage-blob,
  boto3,
  dulwich,
  google-cloud-storage,
  pymongo,
  redis,
}:

buildPythonPackage rec {
  pname = "simplekv";
  version = "0.14.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mbr";
    repo = "simplekv";
    tag = version;
    hash = "sha256-seUGDj2q84+AjDFM1pxMLlHbe9uBgEhmqA96UHjnCmo=";
  };

  build-system = [ setuptools ];

  pythonImportsCheck = [ "simplekv" ];

  optional-dependencies = {
    amazon = [ boto3 ];
    azure = [ azure-storage-blob ];
    google = [ google-cloud-storage ];
    redis = [ redis ];
    mongodb = [ pymongo ];
    git = [ dulwich ];
    /*
      Additional potential dependencies not exposed here:
        sqlalchemy: Our version is too new for simplekv
        appengine-python-standard: Not packaged in nixpkgs
    */
  };

  meta = {
    description = "Simple key-value store for binary data";
    homepage = "https://github.com/mbr/simplekv";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

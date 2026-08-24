{ lib
, buildPythonPackage
, fetchFromGitHub
, # build inputs
  tqdm
, portalocker
, boto3
,
}:
let
  pname = "iopath";
  version = "0.1.10";
in
buildPythonPackage {
  inherit pname version;
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "facebookresearch";
    repo = "iopath";
    tag = "v${version}";
    hash = "sha256-vJV0c+dCFO0wOHahKJ8DbwT2Thx3YjkNLVSpQv9H69g=";
  };

  propagatedBuildInputs = [
    tqdm
    portalocker
  ];

  pythonImportsCheck = [ "iopath" ];

  optional-dependencies = {
    aws = [ boto3 ];
  };

  meta = {
    description = "Python library that provides common I/O interface across different storage backends";
    homepage = "https://github.com/facebookresearch/iopath";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

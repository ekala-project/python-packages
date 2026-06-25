{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  flit-core,
}:

buildPythonPackage rec {
  pname = "cloudpickle";
  version = "3.1.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "cloudpipe";
    repo = "cloudpickle";
    tag = "v${version}";
    hash = "sha256-BsCOEpNCNqq8PS+SdbzF1wq0LXEmtcHJs0pdt2qFw/w=";
  };

  build-system = [ flit-core ];

  pythonImportsCheck = [ "cloudpickle" ];

  meta = {
    description = "Extended pickling support for Python objects";
    homepage = "https://github.com/cloudpipe/cloudpickle";
    license = lib.licenses.bsd3;
  };
}

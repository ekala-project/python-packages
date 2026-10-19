{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  jinja2,
  kubernetes,
  ruamel-yaml,
  six,
  python-string-utils,
}:

buildPythonPackage rec {
  pname = "openshift";
  version = "0.13.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "openshift";
    repo = "openshift-restclient-python";
    tag = "v${version}";
    hash = "sha256-uLfewj7M8KNs3oL1AM18sR/WhAR2mvBfqadyhR73FP0=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "kubernetes" ];

  dependencies = [
    jinja2
    kubernetes
    python-string-utils
    ruamel-yaml
    six
  ];

  pythonImportsCheck = [ "openshift" ];

  meta = {
    description = "Python client for the OpenShift API";
    homepage = "https://github.com/openshift/openshift-restclient-python";
    license = lib.licenses.asl20;
  };
}

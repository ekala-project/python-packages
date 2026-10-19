{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  # build-system
  setuptools,
  flask,
  karton-core,
  mistune,
  networkx,
  prometheus-client,
}:

buildPythonPackage rec {
  pname = "karton-dashboard";
  version = "1.7.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "CERT-Polska";
    repo = "karton-dashboard";
    tag = "v${version}";
    hash = "sha256-DYfL//i1gJ0ci7jVPtrMKC8j+i5/L8rvmbs8zz6Eq2M=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "Flask"
    "mistune"
    "networkx"
    "prometheus-client"
  ];

  dependencies = [
    flask
    karton-core
    mistune
    networkx
    prometheus-client
  ];

  # Project has no tests. pythonImportsCheck requires MinIO configuration

  meta = {
    description = "Web application that allows for Karton task and queue introspection";
    mainProgram = "karton-dashboard";
    homepage = "https://github.com/CERT-Polska/karton-dashboard";
    license = lib.licenses.bsd3;
  };
}

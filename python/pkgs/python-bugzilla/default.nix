{ buildPythonPackage
, fetchPypi
, setuptools
, requests
,
}:

buildPythonPackage rec {
  pname = "python-bugzilla";
  version = "3.3.0";
  pyproject = true;

  src = fetchPypi {
    pname = "python_bugzilla";
    inherit version;
    hash = "sha256-4YIgFx4DPrO6YAxNE5NZ0BqhrOwdrrxDCJEORQdj3kc=";
  };

  build-system = [ setuptools ];

  dependencies = [ requests ];

}

{ lib
, buildPythonPackage
, fetchFromGitHub
, requests
, setuptools
, tqdm
, websocket-client
,
}:

buildPythonPackage rec {
  pname = "plexapi";
  version = "4.18.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pkkid";
    repo = "python-plexapi";
    tag = version;
    hash = "sha256-golJzx+ikMblGjat5lnraE+u0bwZeOjYK2f5ZuWGvmA=";
  };

  build-system = [ setuptools ];

  dependencies = [
    requests
    tqdm
    websocket-client
  ];

  pythonImportsCheck = [ "plexapi" ];

  meta = {
    description = "Python bindings for the Plex API";
    homepage = "https://github.com/pkkid/python-plexapi";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}

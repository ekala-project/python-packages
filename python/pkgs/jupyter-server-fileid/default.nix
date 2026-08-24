{ buildPythonPackage
, fetchFromGitHub
, hatchling
, jupyter-events
, jupyter-server
, click
,
}:

buildPythonPackage rec {
  pname = "jupyter-server-fileid";
  version = "0.9.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jupyter-server";
    repo = "jupyter_server_fileid";
    tag = "v${version}";
    hash = "sha256-ob7hnqU7GdaDHEPF7+gwkmsboKZgiiLzzwxbBUwYHYo=";
  };

  build-system = [ hatchling ];

  dependencies = [
    jupyter-events
    jupyter-server
  ];

  optional-dependencies = {
    cli = [ click ];
  };

  pythonImportsCheck = [ "jupyter_server_fileid" ];

}

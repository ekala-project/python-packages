{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build
  hatchling,

  # runtime
  terminado,

  # tests
  pytest-jupyter,
  pytest-timeout,
}:

let
  self = buildPythonPackage rec {
    pname = "jupyter-server-terminals";
    version = "0.5.4";
    pyproject = true;

    src = fetchFromGitHub {
      owner = "jupyter-server";
      repo = "jupyter_server_terminals";
      tag = "v${version}";
      hash = "sha256-gVR34Ajfv567isVmbP7Zx4AiptrdNqd032QxdMBpsTE=";
    };

    nativeBuildInputs = [ hatchling ];

    propagatedBuildInputs = [ terminado ];

    doCheck = false; # infinite recursion
    meta = {
      description = "Jupyter Server Extension Providing Support for Terminals";
      homepage = "https://github.com/jupyter-server/jupyter_server_terminals";
      license = lib.licenses.bsd3;
      maintainers = [ ];
    };
  };
in
self

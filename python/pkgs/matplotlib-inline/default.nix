{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  flit-core,
  traitlets,
}:

buildPythonPackage rec {
  pname = "matplotlib-inline";
  version = "0.2.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "ipython";
    repo = "matplotlib-inline";
    tag = version;
    hash = "sha256-qExS0SsbnYgu0wFTew90z5QwPyJ+UWGVEgFURSMedSY=";
  };

  build-system = [ flit-core ];

  dependencies = [ traitlets ];

  # wants to import ipython, which creates a circular dependency
  doCheck = false;

  meta = {
    description = "Matplotlib Inline Back-end for IPython and Jupyter";
    homepage = "https://github.com/ipython/matplotlib-inline";
    license = lib.licenses.bsd3;
  };
}

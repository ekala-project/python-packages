{
  lib,
  buildPythonPackage,
  fetchPypi,
  pythonOlder,
  setuptools,
  decorator,
  ipython-pygments-lexers,
  jedi,
  matplotlib-inline,
  pexpect,
  prompt-toolkit,
  pygments,
  stack-data,
  traitlets,
  typing-extensions,
  matplotlib,
}:

buildPythonPackage rec {
  pname = "ipython";
  version = "9.9.0";
  outputs = [
    "out"
    "man"
  ];
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-SPvtGy3l4scXfu+hRKun/LgtrFFPCbV+KsnaNN21QiA=";
  };

  build-system = [ setuptools ];

  dependencies = [
    decorator
    ipython-pygments-lexers
    jedi
    matplotlib-inline
    pexpect
    prompt-toolkit
    pygments
    stack-data
    traitlets
  ]
  ++ lib.optionals (pythonOlder "3.12") [ typing-extensions ];

  optional-dependencies = {
    matplotlib = [ matplotlib ];
  };

  pythonImportsCheck = [ "IPython" ];

  meta = {
    description = "IPython: Productive Interactive Computing";
    downloadPage = "https://github.com/ipython/ipython/";
    homepage = "https://ipython.readthedocs.io/en/stable/";
    license = lib.licenses.bsd3;
  };
}

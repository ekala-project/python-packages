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
  psutil,
}:

buildPythonPackage rec {
  pname = "ipython";
  version = "9.17.1";
  outputs = [
    "out"
    "man"
  ];
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-iRm+jCfyCm9EIxRQKAY/Zje0KgPOV2ZbsSAV7h8HNSk=";
  };

  build-system = [ setuptools ];

  dependencies = [
    decorator
    ipython-pygments-lexers
    jedi
    matplotlib-inline
    pexpect
    prompt-toolkit
    psutil
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

{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, fastcore
, numpy
, ipython
, python-fasthtml
,
}:

buildPythonPackage (finalAttrs: {
  pname = "fastprogress";
  version = "1.1.6";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "fastai";
    repo = "fastprogress";
    tag = finalAttrs.version;
    hash = "sha256-KQ8CYS+SSTve905k695w3TjCFBdWxGR3PqDsYTV8b4k=";
  };

  build-system = [ setuptools ];

  dependencies = [
    fastcore
    numpy
    ipython
    python-fasthtml
  ];

  # no real tests
  pythonImportsCheck = [ "fastprogress" ];

  meta = {
    homepage = "https://github.com/fastai/fastprogress";
    description = "Simple and flexible progress bar for Jupyter Notebook and console";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
})

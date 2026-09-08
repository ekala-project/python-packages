{
  stdenv,
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  numpy,
  scipy,
  pandas,
  matplotlib,
  nbval,
  pyvisa,
  networkx,
  ipython,
  ipykernel,
  ipywidgets,
  jupyter-client,
  sphinx-rtd-theme,
  sphinx,
  nbsphinx,
  openpyxl,
  setuptools,
  typing-extensions,
}:

buildPythonPackage rec {
  pname = "scikit-rf";
  version = "2.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "scikit-rf";
    repo = "scikit-rf";
    tag = "v${version}";
    hash = "sha256-S+vp+Pkt2tExS0UNrOAxM3thc32OjPivXmwoe+UhrEg=";
  };

  build-system = [ setuptools ];

  dependencies = [
    numpy
    scipy
    pandas
    typing-extensions
  ];

  pythonRemoveDeps = [ "pre-commit" ];

  optional-dependencies = {
    plot = [ matplotlib ];
    xlsx = [ openpyxl ];
    netw = [ networkx ];
    visa = [ pyvisa ];
    docs = [
      ipython
      ipykernel
      ipywidgets
      jupyter-client
      sphinx-rtd-theme
      sphinx
      nbsphinx
      openpyxl
      nbval
    ];
  };

  env = lib.optionalAttrs stdenv.hostPlatform.isDarwin { MPLBACKEND = "Agg"; };

  pythonImportsCheck = [ "skrf" ];

  meta = {
    description = "Python library for RF/Microwave engineering";
    homepage = "https://scikit-rf.org/";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}

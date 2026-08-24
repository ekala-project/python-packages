{ stdenv
, lib
, buildPythonPackage
, fetchFromGitHub
, numpy
, scipy
, pandas
, matplotlib
, nbval
, pyvisa
, networkx
, ipython
, ipykernel
, ipywidgets
, jupyter-client
, sphinx-rtd-theme
, sphinx
, nbsphinx
, openpyxl
, setuptools
,
}:

buildPythonPackage rec {
  pname = "scikit-rf";
  version = "1.9.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "scikit-rf";
    repo = "scikit-rf";
    tag = "v${version}";
    hash = "sha256-iOKTQOOJTsj6YIQaJVWFcp9HdUEj43aytpo7VzItxr8=";
  };

  build-system = [ setuptools ];

  dependencies = [
    numpy
    scipy
    pandas
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

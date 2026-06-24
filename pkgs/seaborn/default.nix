{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  fetchpatch2,
  flit-core,
  matplotlib,
  numpy,
  pandas,
  scipy,
}:

buildPythonPackage rec {
  pname = "seaborn";
  version = "0.13.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "mwaskom";
    repo = "seaborn";
    tag = "v${version}";
    hash = "sha256-aGIVcdG/XN999nYBHh3lJqGa3QVt0j8kmzaxdkULznY=";
  };

  patches = [
    (fetchpatch2 {
      name = "numpy_2-compatibility.patch";
      url = "https://github.com/mwaskom/seaborn/commit/58f170fe799ef496adae19925d7d4f0f14f8da95.patch";
      hash = "sha256-/a3G+kNIRv8Oa4a0jPGnL2Wvx/9umMoiq1BXcXpehAg=";
    })
    (fetchpatch2 {
      name = "matplotlib_3_10-compatibility.patch";
      url = "https://github.com/mwaskom/seaborn/commit/385e54676ca16d0132434bc9df6bc41ea8b2a0d4.patch";
      hash = "sha256-nwGwTkP7W9QzgbbAVdb2rASgsMxqFnylMk8GnTE445w=";
    })
    (fetchpatch2 {
      name = "numpy-2.4-compat.patch";
      url = "https://github.com/mwaskom/seaborn/commit/5023f2ee885a45200f5b63156a158ddf7272c29e.patch";
      hash = "sha256-T3OfjEEsPRRv1J6gdq9XmwcWEpPMDzul+LmK8UtV7nk=";
    })
  ];

  nativeBuildInputs = [ flit-core ];

  propagatedBuildInputs = [
    matplotlib
    numpy
    pandas
  ];

  optional-dependencies = {
    stats = [
      scipy
    ];
  };

  env.MPLBACKEND = "Agg";

  pythonImportsCheck = [ "seaborn" ];

  meta = {
    description = "Statistical data visualization";
    homepage = "https://seaborn.pydata.org/";
    license = with lib.licenses; [ bsd3 ];
  };
}

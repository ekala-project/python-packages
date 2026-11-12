{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  numba,
  numpy,
  pynndescent,
  scikit-learn,
  scipy,
  tqdm,

  # optional-dependencies
  bokeh,
  colorcet,
  dask,
  datashader,
  holoviews,
  matplotlib,
  pandas,
  scikit-image,
  seaborn,
  writableTmpDirAsHomeHook,
}:

buildPythonPackage (finalAttrs: {
  pname = "umap-learn";
  version = "0.5.12";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "lmcinnes";
    repo = "umap";
    tag = "release-${finalAttrs.version}";
    hash = "sha256-NORv3wJliKfft/+kMNKL133PKPN88Pt23yqbT1LjUKE=";
  };

  build-system = [ setuptools ];

  dependencies = [
    numba
    numpy
    pynndescent
    scikit-learn
    scipy
    tqdm
  ];

  optional-dependencies = {
    plot = [
      bokeh
      colorcet
      dask
      datashader
      holoviews
      matplotlib
      pandas
      scikit-image
      seaborn
    ];
  };

  # numba caches compiled functions under $HOME at import time
  nativeBuildInputs = [ writableTmpDirAsHomeHook ];

  pythonImportsCheck = [ "umap" ];

  meta = {
    description = "Uniform Manifold Approximation and Projection";
    homepage = "https://github.com/lmcinnes/umap";
    license = lib.licenses.bsd3;
  };
})

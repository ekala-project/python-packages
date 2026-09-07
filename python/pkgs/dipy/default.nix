{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  meson-python,
  packaging,
  cython,
  numpy,
  scipy,
  h5py,
  nibabel,
  tqdm,
  trx-python,
}:

buildPythonPackage rec {
  pname = "dipy";
  version = "1.12.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "dipy";
    repo = "dipy";
    tag = version;
    hash = "sha256-4DQswr46du49h5v+mvhkjH4s3WFDJ2LwmURsoM9ICz8=";
  };

  build-system = [
    cython
    meson-python
    numpy
    packaging
  ];

  pythonRelaxDeps = [ "trx-python" ];

  dependencies = [
    numpy
    scipy
    h5py
    nibabel
    packaging
    tqdm
    trx-python
  ];

  #   - some tests require data download (see dipy/dipy/issues/2092);
  #   - running the tests manually causes a multiprocessing hang;
  #   - import weirdness when running the tests
  pythonImportsCheck = [
    "dipy"
  ];

  meta = {
    homepage = "https://dipy.org/";
    description = "Diffusion imaging toolkit for Python";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}

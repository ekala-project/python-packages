{
  lib,
  stdenv,
  fetchFromGitHub,
  buildPythonPackage,
  python,
  cython,
  dask,
  imageio,
  lazy-loader,
  matplotlib,
  meson-python,
  networkx,
  numpy,
  packaging,
  pillow,
  pooch,
  pyamg,
  pythran,
  pywavelets,
  scikit-learn,
  scipy,
  tifffile,
}:

buildPythonPackage rec {
  pname = "scikit-image";
  version = "0.26.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "scikit-image";
    repo = "scikit-image";
    tag = "v${version}";
    hash = "sha256-VpvlG2ECbq+FWLZ4RfdbbR3V6Fbw0RIvnVp+w0Rp+8o=";
  };

  postPatch = ''
    patchShebangs src/skimage/_build_utils/{version,cythoner}.py

    substituteInPlace src/skimage/_build_utils/version.py \
      --replace-fail "version = version_from_init()" "version = \"${version}\""
  '';

  build-system = [
    cython
    meson-python
    numpy
    pythran
  ];

  dependencies = [
    imageio
    lazy-loader
    networkx
    numpy
    packaging
    pillow
    scipy
    tifffile
  ];

  doCheck = false;

  pythonImportsCheck = [
    "skimage"
    "skimage._shared"
    "skimage.draw"
    "skimage.feature"
    "skimage.restoration"
    "skimage.filters"
    "skimage.graph"
    "skimage.io"
    "skimage.measure"
    "skimage.morphology"
    "skimage.transform"
    "skimage.util"
    "skimage.segmentation"
  ];

  meta = {
    description = "Image processing routines for SciPy";
    homepage = "https://scikit-image.org";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}

{
  lib,
  stdenv,
  buildPythonPackage,
  fetchFromGitHub,
  python,
  toPythonModule,

  # build-system
  clang,
  pipcl,
  setuptools,
  swig,

  # native dependencies
  freetype,
  harfbuzz,
  openjpeg,
  jbig2dec,
  libjpeg_turbo,
  gumbo,

  # dependencies
  mupdf,
}:

let
  # PyMuPDF needs the C++ bindings generated
  mupdf-cxx = mupdf.override {
    enableOcr = true;
    enableCxx = true;
    enablePython = true;
    enableBarcode = true;
  };
  mupdf-cxx-lib = toPythonModule (lib.getLib mupdf-cxx);
  mupdf-cxx-dev = lib.getDev mupdf-cxx;
in
buildPythonPackage (finalAttrs: {
  pname = "pymupdf";
  version = "1.27.2.3";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pymupdf";
    repo = "PyMuPDF";
    tag = finalAttrs.version;
    hash = "sha256-KeddkzRkJ/tcINftYrx/BY0Z3WUaTU9iBqL5UorvclU=";
  };

  patches = [
    # `conftest.py` tries to run `pip install` to install test dependencies.
    ./conftest-dont-pip-install.patch
  ];

  # swig is not wrapped as Python package
  postPatch = ''
    substituteInPlace setup.py \
      --replace-fail "ret.append('swig')" "pass" \
      --replace-fail "ret.append('swig==4.3.1')" "pass"
  '';

  # `build_extension` passes arguments to `$LD` that are meant for `c++`.
  # When `LD` is not set, `build_extension` falls back to using `c++` in `PATH`.
  # See https://github.com/pymupdf/PyMuPDF/blob/1.26.6/pipcl.py#L1998 for details.
  preConfigure = ''
    unset LD
  '';

  build-system = [
    clang
    pipcl
    swig
    setuptools
  ];

  dependencies = [
    mupdf-cxx-lib
  ];

  buildInputs = [
    freetype
    harfbuzz
    openjpeg
    jbig2dec
    libjpeg_turbo
    gumbo
  ];

  env = {
    # force using system MuPDF (must be defined in environment and empty)
    PYMUPDF_SETUP_MUPDF_BUILD = "";
    # Setup the name of the package away from the default 'libclang'
    PYMUPDF_SETUP_LIBCLANG = "clang";
    # provide MuPDF paths
    PYMUPDF_MUPDF_LIB = "${mupdf-cxx-lib}/lib";
    PYMUPDF_MUPDF_INCLUDE = "${mupdf-cxx-dev}/include";
  };

  # TODO: manually add mupdf rpath until upstream fixes it
  postInstall = lib.optionalString stdenv.hostPlatform.isDarwin ''
    for lib in */*.so $out/${python.sitePackages}/*/*.so; do
      install_name_tool -add_rpath ${mupdf-cxx-lib}/lib "$lib"
    done
  '';

  pythonImportsCheck = [
    "pymupdf"
    "fitz"
  ];

  meta = {
    description = "Python bindings for MuPDF's rendering library";
    homepage = "https://github.com/pymupdf/PyMuPDF";
    license = lib.licenses.agpl3Only;
    maintainers = [ ];
    platforms = lib.platforms.unix;
  };
})

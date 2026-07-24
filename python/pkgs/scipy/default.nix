{
  lib,
  stdenv,
  fetchurl,
  writeTextFile,
  python,
  buildPythonPackage,
  fetchFromGitHub,
  fetchpatch,

  # build-system
  cython,
  gfortran,
  meson-python,
  nukeReferences,
  pkg-config,
  pythran,
  setuptools,

  # buildInputs
  blas,
  lapack,
  pybind11,

  # dependencies
  numpy,
}:

buildPythonPackage (finalAttrs: {
  pname = "scipy";
  version = "1.17.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "scipy";
    repo = "scipy";
    tag = "v${finalAttrs.version}";
    hash = "sha256-lFmqdbCf7pcosdZ7RFMv+8H9+ztMJbDS5g5fQs8Nws8=";
    fetchSubmodules = true;
  };

  patches = [
    (fetchpatch {
      url = "https://github.com/scipy/scipy/commit/dd50ac9d98dbb70625333a23e3a90e493228e3be.patch";
      hash = "sha256-Vf6/hhwu6X5s8KWhq8bUZKtSkdVu/GtEpGtj8Olxe7s=";
      excludes = [ "doc/source/dev/contributor/meson_advanced.rst" ];
    })
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "numpy>=2.0.0,<2.7" numpy
  ''
  + lib.optionalString (stdenv.hostPlatform.isDarwin) ''
    substituteInPlace scipy/meson.build \
      --replace-fail "r = run_command('xcrun', '-sdk', 'macosx', '--show-sdk-version', check: true)" ""
    substituteInPlace scipy/meson.build \
      --replace-fail "sdkVersion = r.stdout().strip()" "sdkVersion = '${stdenv.hostPlatform.darwinSdkVersion}'"
  '';

  build-system = [
    cython
    gfortran
    meson-python
    nukeReferences
    pkg-config
    pythran
    setuptools
  ];

  buildInputs = [
    blas
    lapack
    pybind11
  ];

  dependencies = [ numpy ];

  __darwinAllowLocalNetworking = true;

  preConfigure = ''
    export NPY_NUM_BUILD_JOBS=$NIX_BUILD_CORES
    export XDG_CACHE_HOME=$PWD; export HOME=$(mktemp -d); mkdir scipy-data
  ''
  + (lib.concatStringsSep "\n" (
    lib.mapAttrsToList (
      d: dpath: "cp ${dpath} scipy-data/${d}.dat"
    ) finalAttrs.finalPackage.passthru.datasets
  ));

  mesonFlags = [
    "-Dblas=${blas.pname}"
    "-Dlapack=${lapack.pname}"
    "--cross-file=${finalAttrs.finalPackage.passthru.crossFile}"
  ];

  hardeningDisable = lib.optionals (stdenv.hostPlatform.isAarch64 && stdenv.hostPlatform.isDarwin) [
    "stackprotector"
  ];

  postInstall = ''
    nuke-refs $out/${python.sitePackages}/scipy/__config__.py
    rm $out/${python.sitePackages}/scipy/__pycache__/__config__.*.opt-1.pyc
  '';

  requiredSystemFeatures = [ "big-parallel" ];

  passthru = {
    inherit blas;
    datasetsHashes = {
      ascent = "sha256-A84STBr8iA+HtV9rBhEQ4uHpOWeRhPVhTjjazGwZV+I=";
      ecg = "sha256-8grTNl+5t/hF0OXEi2/mcIE3fuRmw6Igt/afNciVi68=";
      face = "sha256-nYsLTQgTE+K0hXSMdwRy5ale0XOBRog9hMcDBJPoKIY=";
    };
    datasets = lib.mapAttrs (
      d: hash:
      fetchurl {
        url = "https://raw.githubusercontent.com/scipy/dataset-${d}/main/${d}.dat";
        inherit hash;
      }
    ) finalAttrs.finalPackage.passthru.datasetsHashes;
    buildConfig = {
      properties = {
        numpy-include-dir = numpy.coreIncludeDir;
        pythran-include-dir = "${pythran}/${python.sitePackages}/pythran";
        host-python-path = python.interpreter;
        host-python-version = python.pythonVersion;
      };
    };
    crossFile = writeTextFile {
      name = "cross-file-scipy.conf";
      text = lib.generators.toINI {
        mkKeyValue = lib.generators.mkKeyValueDefault {
          mkValueString = v: "'${v}'";
        } " = ";
      } finalAttrs.finalPackage.passthru.buildConfig;
    };
  };

  env.SCIPY_USE_G77_ABI_WRAPPER = 1;

  meta = {
    description = "SciPy (pronounced 'Sigh Pie') is open-source software for mathematics, science, and engineering";
    downloadPage = "https://github.com/scipy/scipy";
    homepage = "https://www.scipy.org/";
    license = lib.licenses.bsd3;
  };
})

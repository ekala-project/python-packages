{
  lib,
  stdenv,
  buildPythonPackage,
  clang-tools,
  cmake,
  fetchFromGitHub,
  jbig2dec,
  deprecated,
  lxml,
  nanobind,
  ninja,
  packaging,
  pillow,
  qpdf,
  replaceVars,
  scikit-build-core,
}:

buildPythonPackage (finalAttrs: {
  pname = "pikepdf";
  version = "10.10.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pikepdf";
    repo = "pikepdf";
    tag = "v${finalAttrs.version}";
    postFetch = ''
      rm "$out/.git_archival.txt"
    '';
    hash = "sha256-ZNynqKNmUO8wGoT3Ml2sS2kOGJD37JRaHzBV9igvoHw=";
  };

  patches = [
    (replaceVars ./paths.patch {
      jbig2dec = lib.getExe' jbig2dec "jbig2dec";
      mutool = "mutool";
    })
  ];

  buildInputs = [ qpdf ];

  build-system = [
    cmake
    nanobind
    ninja
    scikit-build-core
  ]
  ++ lib.optionals stdenv.cc.isClang [
    clang-tools
  ];

  dontUseCmakeConfigure = true;

  dependencies = [
    deprecated
    lxml
    packaging
    pillow
  ];

  pythonImportsCheck = [ "pikepdf" ];

  meta = {
    homepage = "https://github.com/pikepdf/pikepdf";
    description = "Read and write PDFs with Python, powered by qpdf";
    license = lib.licenses.mpl20;
    maintainers = [ ];
  };
})

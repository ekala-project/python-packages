{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  certifi,
  charset-normalizer,
  courlan,
  htmldate,
  justext,
  lxml,
  urllib3,
}:

buildPythonPackage (finalAttrs: {
  pname = "trafilatura";
  version = "2.1.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "adbar";
    repo = "trafilatura";
    tag = "v${finalAttrs.version}";
    hash = "sha256-hSeJH+8JX8QC3zHMZ3+M2H0C3xI+BCvLnSo/Ih1wUQw=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [
    "lxml"
  ];

  dependencies = [
    certifi
    charset-normalizer
    courlan
    htmldate
    justext
    lxml
    urllib3
  ];

  pythonImportsCheck = [ "trafilatura" ];

  meta = {
    description = "Python package and command-line tool designed to gather text on the Web";
    homepage = "https://trafilatura.readthedocs.io";
    downloadPage = "https://github.com/adbar/trafilatura";
    license = lib.licenses.asl20;
    maintainers = [ ];
    mainProgram = "trafilatura";
  };
})

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
  version = "2.2.0";
  pyproject = true;
  __structuredAttrs = true;

  src = fetchFromGitHub {
    owner = "adbar";
    repo = "trafilatura";
    tag = "v${finalAttrs.version}";
    hash = "sha256-U6sqUuPQZiv7VMCJ5lLJ3qqdEBq60J82nHHlGdCOyX4=";
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

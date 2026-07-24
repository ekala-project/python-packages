{
  lib,
  buildPythonPackage,
  charset-normalizer,
  dateparser,
  faust-cchardet,
  fetchFromGitHub,
  lxml,
  python-dateutil,
  setuptools,
  urllib3,
}:

buildPythonPackage rec {
  pname = "htmldate";
  version = "1.10.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "adbar";
    repo = "htmldate";
    tag = "v${version}";
    hash = "sha256-3qtksgzqcgWtUv81Aqeh0nTWYnH0PjPLG4NuYChbV0g=";
  };

  build-system = [ setuptools ];

  dependencies = [
    charset-normalizer
    dateparser
    lxml
    python-dateutil
    urllib3
  ];

  pythonRelaxDeps = [ "lxml" ];

  optional-dependencies = {
    speed = [
      faust-cchardet
      urllib3
    ]
    ++ urllib3.optional-dependencies.brotli;
    all = [
      faust-cchardet
      urllib3
    ]
    ++ urllib3.optional-dependencies.brotli;
  };
  pythonImportsCheck = [ "htmldate" ];

  meta = {
    description = "Module for the extraction of original and updated publication dates from URLs and web pages";
    homepage = "https://htmldate.readthedocs.io";
    license = lib.licenses.asl20;
    maintainers = [ ];
    mainProgram = "htmldate";
  };
}

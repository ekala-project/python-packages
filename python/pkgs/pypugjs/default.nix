{
  lib,
  buildPythonPackage,
  charset-normalizer,
  fetchFromGitHub,
  poetry-core,
  six,
}:

buildPythonPackage rec {
  pname = "pypugjs";
  version = "7.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "kakulukia";
    repo = "pypugjs";
    tag = "v${version}";
    hash = "sha256-L4vE0INrSsjtMQ2Psx2YUDdfMoetGd1rFgmeP5bSUVo=";
  };

  build-system = [
    poetry-core
  ];

  dependencies = [
    six
    charset-normalizer
  ];

  pythonRelaxDeps = [
    "charset-normalizer"
  ];

  pythonImportsCheck = [
    "pypugjs"
  ];

  meta = {
    description = "PugJS syntax template adapter for Django, Jinja2, Mako and Tornado templates";
    mainProgram = "pypugjs";
    homepage = "https://github.com/kakulukia/pypugjs";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

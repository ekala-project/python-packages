{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  humanize,
  jinja2,
}:

buildPythonPackage rec {
  pname = "jinja2-humanize-extension";
  version = "0.4.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "metwork-framework";
    repo = "jinja2_humanize_extension";
    tag = "v${version}";
    hash = "sha256-bSSwPCPLIWIRhIgaSwHnVTj5mpvwn259GXYeGr5NHBQ=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    humanize
    jinja2
  ];

  pythonImportsCheck = [
    "jinja2_humanize_extension"
  ];
  meta = {
    description = "Jinja2 extension to use humanize library inside jinja2 templates";
    homepage = "https://github.com/metwork-framework/jinja2_humanize_extension";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}

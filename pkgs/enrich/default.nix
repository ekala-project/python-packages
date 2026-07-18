{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  setuptools-scm,
  rich,
}:

buildPythonPackage rec {
  pname = "enrich";
  version = "1.2.7";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-Ciqw0pMd/4lHASYC0SNNKj7gAtmjVbXXC+a/VGYAiJM=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail '"pip >= 19.3.1",' "" \
      --replace-fail '"setuptools_scm_git_archive >= 1.1",' "" \
      --replace-fail '"wheel >= 0.33.6",' ""
  '';

  dependencies = [ rich ];

  pythonImportsCheck = [ "enrich" ];

  meta = {
    description = "Enrich adds few missing features to the wonderful rich library";
    homepage = "https://github.com/pycontribs/enrich";
    license = lib.licenses.mit;
  };
}

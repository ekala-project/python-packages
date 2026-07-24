{
  lib,
  buildPythonPackage,
  fetchPypi,
  setuptools,
  click-plugins,
  colorama,
  requests,
  tldextract,
  xlsxwriter,
}:

buildPythonPackage rec {
  pname = "shodan";
  version = "1.31.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-xzJ1OG6gI5DhlsNcZgcGoo3U1TfFoh6zh6tiNvrCUfY=";
  };

  build-system = [ setuptools ];

  dependencies = [
    click-plugins
    colorama
    requests
    setuptools
    tldextract
    xlsxwriter
  ];

  pythonImportsCheck = [ "shodan" ];

  meta = {
    description = "Python library and command-line utility for Shodan";
    homepage = "https://github.com/achillean/shodan-python";
    license = lib.licenses.mit;
  };
}

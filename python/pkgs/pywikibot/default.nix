{
  lib,
  buildPythonPackage,
  fetchPypi,
  mwparserfromhell,
  requests,
  packaging,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pywikibot";
  version = "11.7.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-vX9MW1miCEPkbNVUCgPZKSL120bJ1hXOAJztVqHvaDs=";
  };

  build-system = [ setuptools ];

  dependencies = [
    mwparserfromhell
    requests
    packaging
  ];

  pythonImportsCheck = [ "pywikibot" ];

  meta = {
    description = "Python MediaWiki bot framework";
    mainProgram = "pwb";
    homepage = "https://www.mediawiki.org/wiki/Manual:Pywikibot";
    license = lib.licenses.mit;
  };
}

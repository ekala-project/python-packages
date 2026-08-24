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
  version = "10.7.4";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-/hHfZRLoEgaPKZLus9x/d5O62GnwU/1A7PAsebGj634=";
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
    maintainers = [ ];
  };
}

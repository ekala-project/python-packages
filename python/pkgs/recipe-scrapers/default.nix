{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  beautifulsoup4,
  extruct,
  isodate,
  language-tags,
  regex,
  requests,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "recipe-scrapers";
  version = "15.12.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "hhursev";
    repo = "recipe-scrapers";
    tag = finalAttrs.version;
    hash = "sha256-ME5/I2qnuTalgsiI34hQ45AyFqfol6dfLnc/S9vJ6tc=";
  };

  build-system = [ setuptools ];

  dependencies = [
    beautifulsoup4
    extruct
    isodate
    language-tags
    regex
  ];

  optional-dependencies = {
    online = [ requests ];
  };

  pythonImportsCheck = [ "recipe_scrapers" ];

  meta = {
    description = "Python package for scraping recipes data";
    homepage = "https://github.com/hhursev/recipe-scrapers";
    license = lib.licenses.mit;
  };
})

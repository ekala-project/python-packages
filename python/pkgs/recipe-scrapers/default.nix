{ lib
, buildPythonPackage
, fetchFromGitHub
, beautifulsoup4
, extruct
, isodate
, language-tags
, regex
, requests
, setuptools
,
}:

buildPythonPackage (finalAttrs: {
  pname = "recipe-scrapers";
  version = "15.11.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "hhursev";
    repo = "recipe-scrapers";
    tag = finalAttrs.version;
    hash = "sha256-S0/RPVeEr/lAPJZSUwCippuXyirYnmaAuesWGYwg6kE=";
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
    maintainers = [ ];
  };
})

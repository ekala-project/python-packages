{ lib
, buildPythonPackage
, fetchPypi
, smartypants
, hatchling
,
}:

buildPythonPackage rec {
  pname = "typogrify";
  version = "2.1.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-8KoATpgDKm5r5MnaZefrcVDjbKO/UIrbzagrTQA+Ye4=";
  };

  build-system = [ hatchling ];

  dependencies = [ smartypants ];

  pythonImportsCheck = [ "typogrify.filters" ];

  meta = {
    description = "Filters to enhance web typography, including support for Django & Jinja templates";
    homepage = "https://github.com/justinmayer/typogrify";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}

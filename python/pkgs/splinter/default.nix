{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  urllib3,
  selenium,
  cssselect,
  django,
  flask,
  lxml,
  zope-testbrowser,
}:

buildPythonPackage rec {
  pname = "splinter";
  version = "0.21.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "cobrateam";
    repo = "splinter";
    tag = version;
    hash = "sha256-PGGql8yI1YosoUBAyDoI/8k7s4sVYnXEV7eow3GHH88=";
  };

  patches = [
    ./lxml-6.patch
  ];

  build-system = [ setuptools ];

  dependencies = [ urllib3 ];

  optional-dependencies = {
    "zope.testbrowser" = [
      zope-testbrowser
      lxml
      cssselect
    ];
    django = [
      django
      lxml
      cssselect
    ];
    flask = [
      flask
      lxml
      cssselect
    ];
    selenium = [ selenium ];
  };

  pythonImportsCheck = [ "splinter" ];

  meta = {
    description = "Browser abstraction for web acceptance testing";
    homepage = "https://github.com/cobrateam/splinter";
    license = lib.licenses.bsd3;
    maintainers = [ ];
  };
}

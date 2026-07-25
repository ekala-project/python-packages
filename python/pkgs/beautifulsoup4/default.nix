{
  lib,
  buildPythonPackage,
  fetchPypi,
  fetchpatch,

  # build-system
  hatchling,

  # docs
  sphinxHook,

  # dependencies
  soupsieve,
  typing-extensions,

  # optional-dependencies
  chardet,
  charset-normalizer,
  faust-cchardet,
  html5lib,
  lxml,
}:

buildPythonPackage rec {
  pname = "beautifulsoup4";
  version = "4.15.0";
  pyproject = true;

  outputs = [
    "out"
    "doc"
  ];

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-KI48p9VLBvKsGRlwvCdcGTnLRtRQslW/ZxiwSqN6tPc=";
  };

  build-system = [ hatchling ];

  nativeBuildInputs = [ sphinxHook ];

  dependencies = [
    soupsieve
    typing-extensions
  ];

  optional-dependencies = {
    chardet = [ chardet ];
    cchardet = [ faust-cchardet ];
    charset-normalizer = [ charset-normalizer ];
    html5lib = [ html5lib ];
    lxml = [ lxml ];
  };
  pythonImportsCheck = [ "bs4" ];
  meta = {
    description = "HTML and XML parser";
    homepage = "http://crummy.com/software/BeautifulSoup/bs4/";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

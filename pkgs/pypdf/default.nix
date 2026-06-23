{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  flit-core,

  # docs
  sphinxHook,
  sphinx-rtd-theme,
  myst-parser,

  # optionals
  cryptography,
  fonttools,
  pillow,
}:

buildPythonPackage rec {
  pname = "pypdf";
  version = "6.13.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "py-pdf";
    repo = "pypdf";
    tag = version;
    fetchSubmodules = true;
    hash = "sha256-P/tm4roaVVnEq/bUsyk3S2ts7UWBWbDuZ1RqNKGxUS0=";
  };

  outputs = [
    "out"
    "doc"
  ];

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "--disable-socket" ""
  '';

  build-system = [ flit-core ];

  nativeBuildInputs = [
    sphinxHook
    sphinx-rtd-theme
    myst-parser
  ];

  optional-dependencies = rec {
    full = crypto ++ fonts ++ image;
    crypto = [ cryptography ];
    fonts = [ fonttools ];
    image = [ pillow ];
  };

  pythonImportsCheck = [ "pypdf" ];

  meta = {
    description = "Pure-python PDF library capable of splitting, merging, cropping, and transforming the pages of PDF files";
    homepage = "https://github.com/py-pdf/pypdf";
    license = lib.licenses.bsd3;
  };
}

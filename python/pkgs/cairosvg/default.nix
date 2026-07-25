{
  lib,
  buildPythonPackage,
  fetchFromGitHub,

  # build-system
  setuptools,

  # dependencies
  cairocffi,
  cssselect2,
  defusedxml,
  pillow,
  tinycss2,
}:

buildPythonPackage rec {
  pname = "cairosvg";
  version = "2.9.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "Kozea";
    repo = "CairoSVG";
    tag = version;
    hash = "sha256-WtMFOYaN/cRrL1Q4ma/UkR3kNFObNhp0Gm7i9NQAqz8=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cairocffi
    cssselect2
    defusedxml
    pillow
    tinycss2
  ];

  nativeBuildInputs = [ cairocffi ];
  pythonImportsCheck = [ "cairosvg" ];

  meta = {
    homepage = "https://cairosvg.org";
    license = lib.licenses.lgpl3Plus;
    description = "SVG converter based on Cairo";
    mainProgram = "cairosvg";
    maintainers = [ lib.maintainers.sarahec ];
  };
}

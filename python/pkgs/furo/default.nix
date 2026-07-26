{
  lib,
  buildPythonPackage,
  runCommand,
  fetchFromGitHub,
  fetchPypi,
  flit-core,
  accessible-pygments,
  beautifulsoup4,
  pygments,
  sphinx,
  sphinx-basic-ng,
  unzip,
}:

let
  pname = "furo";
  version = "2025.12.19";
  pypiVersion =
    let
      versionComponents = lib.strings.splitString "." version;
      dropLeadingZero = lib.strings.removePrefix "0";
    in
    (lib.lists.elemAt versionComponents 0)
    + "."
    + (dropLeadingZero (lib.lists.elemAt versionComponents 1))
    + "."
    + (dropLeadingZero (lib.lists.elemAt versionComponents 2));

  src = fetchFromGitHub {
    owner = "pradyunsg";
    repo = "furo";
    tag = version;
    hash = "sha256-s9CQXmHI3PoXbB24e8rUd9ip02UZTjPHP4Ar6hV3mUc=";
  };

  web =
    let
      web-bin-src = fetchPypi {
        inherit pname;
        version = pypiVersion;
        format = "wheel";
        dist = "py3";
        python = "py3";
        hash = "sha256-uw6tUwn5UAEwZlomvuh2k8Qc5Nvf+GTb+2sNrkZz0k8=";
      };
    in
    runCommand "${pname}-web-bin"
      {
        nativeBuildInputs = [ unzip ];
      }
      ''
        mkdir $out
        unzip ${web-bin-src}
        cp -rv furo/theme/furo/static/{scripts,styles} $out/
      '';
in

buildPythonPackage rec {
  inherit pname version src;
  pyproject = true;

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "sphinx-theme-builder >= 0.2.0a10" "flit-core" \
      --replace-fail "sphinx_theme_builder" "flit_core.buildapi"

    pushd src/furo/theme/furo/static
    cp -rv ${web}/{scripts,styles} .
    popd
  '';

  build-system = [ flit-core ];

  pythonRelaxDeps = [ "sphinx" ];

  dependencies = [
    accessible-pygments
    beautifulsoup4
    pygments
    sphinx
    sphinx-basic-ng
  ];

  pythonImportsCheck = [ "furo" ];

  meta = {
    description = "Clean customizable documentation theme for Sphinx";
    homepage = "https://github.com/pradyunsg/furo";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

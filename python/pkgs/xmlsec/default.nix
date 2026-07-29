{ lib
, buildPythonPackage
, fetchFromGitHub
, pkgs
, # build-system
  pkgconfig
, setuptools-scm9
, # nativeBuildInputs
  pkg-config
, # buildInputs
  libtool
, libxml2
, libxslt
, # dependencies
  lxml
,
}:

buildPythonPackage (finalAttrs: {
  pname = "xmlsec";
  version = "1.3.17";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "xmlsec";
    repo = "python-xmlsec";
    tag = finalAttrs.version;
    hash = "sha256-p3V75DLUI2PKdharP3/0HrKOgma9Kh3lAOZLRAQjo80=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "lxml==" "lxml>=" \
      --replace-fail "setuptools==" "setuptools>="
  '';

  build-system = [
    pkgconfig
    setuptools-scm9
  ];

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    libtool
    libxml2
    libxslt
    pkgs.xmlsec
  ];

  dependencies = [ lxml ];

  pythonImportsCheck = [ "xmlsec" ];

  meta = {
    description = "Python bindings for the XML Security Library";
    homepage = "https://github.com/xmlsec/python-xmlsec";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})

{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, zodbpickle
, zope-interface
,
}:

buildPythonPackage rec {
  pname = "zope-copy";
  version = "6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "zopefoundation";
    repo = "zope.copy";
    tag = version;
    hash = "sha256-hYeLUSwAq5rK4TRngvNQGR4Fdimb2k5dHtFdptMVqPo=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools ==" "setuptools >="
  '';

  build-system = [ setuptools ];

  dependencies = [
    zodbpickle
    zope-interface
  ];

  pythonImportsCheck = [ "zope.copy" ];

  unittestFlagsArray = [
    "-s"
    "src/zope/copy"
  ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Pluggable object copying mechanism";
    homepage = "https://github.com/zopefoundation/zope.copy";
    license = lib.licenses.zpl21;
    maintainers = [ ];
  };
}

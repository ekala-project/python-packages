{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, zope-schema
, zope-interface
,
}:

buildPythonPackage rec {
  pname = "zope-filerepresentation";
  version = "7.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "zopefoundation";
    repo = "zope.filerepresentation";
    tag = version;
    hash = "sha256-VWi00b7m+aKwkg/Gfzo5fJWMqdMqgowBpkqsYcEO2gY=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools ==" "setuptools >="
  '';

  build-system = [ setuptools ];

  dependencies = [
    zope-interface
    zope-schema
  ];

  pythonImportsCheck = [ "zope.filerepresentation" ];

  unittestFlagsArray = [ "src/zope/filerepresentation" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    homepage = "https://github.com/zopefoundation/zope.filerepresentation";
    description = "File-system Representation Interfaces";
    license = lib.licenses.zpl21;
    maintainers = [ ];
  };
}

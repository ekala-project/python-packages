{ lib
, buildPythonPackage
, fetchFromGitHub
, isPyPy
, setuptools
,
}:

buildPythonPackage rec {
  pname = "zope-testing";
  version = "6.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "zopefoundation";
    repo = "zope.testing";
    tag = version;
    hash = "sha256-dAUiG8DxlhQKMBXh49P0CDC9UjqAYjB+2vVCTI36cgc=";
  };

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace-fail "setuptools >= 78.1.1,< 81" setuptools
  '';

  build-system = [ setuptools ];

  doCheck = !isPyPy;

  pythonImportsCheck = [ "zope.testing" ];

  pythonNamespaces = [ "zope" ];

  meta = {
    description = "Zope testing helpers";
    homepage = "https://github.com/zopefoundation/zope.testing";
    license = lib.licenses.zpl21;
    maintainers = [ ];
  };
}

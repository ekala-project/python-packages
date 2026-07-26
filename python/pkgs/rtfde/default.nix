{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  lark,
  oletools,
  setuptools,
}:

buildPythonPackage (finalAttrs: {
  pname = "rtfde";
  version = "0.1.2.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "seamustuohy";
    repo = "RTFDE";
    tag = finalAttrs.version;
    hash = "sha256-1yjxp6N07I9kwFRtgsLo9UPSG4FU+ic1tNm6U/xWk74=";
  };

  build-system = [ setuptools ];

  pythonRelaxDeps = [ "lark" ];

  dependencies = [
    lark
    oletools
  ];

  pythonImportsCheck = [ "RTFDE" ];

  meta = {
    description = "Library for extracting encapsulated HTML and plain text content from the RTF bodies";
    homepage = "https://github.com/seamustuohy/RTFDE";
    license = lib.licenses.lgpl3Only;
    maintainers = [ ];
  };
})

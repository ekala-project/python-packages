{ lib
, buildPythonPackage
, deprecated
, fetchFromCodeberg
, jaconv
, setuptools-scm
,
}:

buildPythonPackage rec {
  pname = "pykakasi";
  version = "2.3.0";
  pyproject = true;

  src = fetchFromCodeberg {
    owner = "miurahr";
    repo = "pykakasi";
    tag = "v${version}";
    hash = "sha256-b2lYYdg1RW1xRD3hym7o1EnxzN/U5txVTWRifwZn3k0=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [
    jaconv
    deprecated
  ];

  pythonImportsCheck = [ "pykakasi" ];

  meta = {
    description = "Python converter for Japanese Kana-kanji sentences into Kana-Roman";
    homepage = "https://codeberg.org/miurahr/pykakasi";
    license = lib.licenses.gpl3Plus;
    maintainers = [ ];
    mainProgram = "kakasi";
  };
}

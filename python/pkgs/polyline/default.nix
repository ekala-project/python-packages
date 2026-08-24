{ lib
, buildPythonPackage
, fetchFromGitHub
, setuptools
, wheel
,
}:

buildPythonPackage rec {
  pname = "polyline";
  version = "2.0.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "frederickjansen";
    repo = "polyline";
    tag = "v${version}";
    hash = "sha256-PaQLHz256ZZ+0PdSSeGM+rjubSnT4fQfpD1Uj3JfBt8=";
  };

  nativeBuildInputs = [
    setuptools
    wheel
  ];

  pythonImportsCheck = [ "polyline" ];

  meta = {
    description = "Python implementation of Google's Encoded Polyline Algorithm Format";
    homepage = "https://github.com/frederickjansen/polyline";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

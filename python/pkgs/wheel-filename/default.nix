{ lib
, buildPythonPackage
, fetchFromGitHub
, hatchling
,
}:

buildPythonPackage rec {
  pname = "wheel-filename";
  version = "2.1.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jwodder";
    repo = "wheel-filename";
    tag = "v${version}";
    hash = "sha256-YlJ3mQoaNY7wiLzADLZuTET5i37e/zn2S7n9dOdcE0E=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "wheel_filename" ];

  meta = {
    description = "Parse wheel filenames";
    homepage = "https://github.com/jwodder/wheel-filename";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "wheel-filename";
  };
}

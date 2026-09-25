{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
  requests,
}:

buildPythonPackage (finalAttrs: {
  pname = "prawcore";
  version = "4.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "praw-dev";
    repo = "prawcore";
    tag = "v${finalAttrs.version}";
    hash = "sha256-1ZWr3AQcnF0+16nQjkqmpOXvAd2o+fXUc33FlWzYGM8=";
  };

  build-system = [ hatchling ];

  dependencies = [ requests ];

  pythonImportsCheck = [ "prawcore" ];

  meta = {
    description = "Low-level communication layer for PRAW";
    homepage = "https://praw.readthedocs.org/";
    license = lib.licenses.bsd2;
  };
})

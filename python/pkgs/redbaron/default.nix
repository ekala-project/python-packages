{ lib
, buildPythonPackage
, fetchFromGitHub
, # build-system
  setuptools
, # dependencies
  baron
,
}:

buildPythonPackage (finalAttrs: {
  pname = "redbaron";
  version = "0.9.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "PyCQA";
    repo = "redbaron";
    tag = finalAttrs.version;
    hash = "sha256-Wgq7ltAsy4aPtfEiLp42p5pfcc/w9U0kFJTVNqy0iio=";
  };

  build-system = [
    setuptools
  ];

  dependencies = [
    baron
  ];

  meta = {
    description = "Abstraction on top of baron, a FST for python to make writing refactoring code a realistic task";
    homepage = "https://redbaron.readthedocs.io/en/latest";
    downloadPage = "https://github.com/PyCQA/redbaron";
    license = lib.licenses.lgpl3Plus;
    maintainers = [ ];
  };
})

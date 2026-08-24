{ lib
, buildPythonPackage
, fetchFromGitHub
, hatch-vcs
, hatchling
, httpx
,
}:

buildPythonPackage rec {
  pname = "pylast";
  version = "7.0.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pylast";
    repo = "pylast";
    tag = version;
    hash = "sha256-NA49V9s4k0l0icoiKVjxTAdhC+MuNgbbeImAjzGB8Xo=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  dependencies = [ httpx ];

  pythonImportsCheck = [ "pylast" ];

  meta = {
    description = "Python interface to last.fm (and compatibles)";
    homepage = "https://github.com/pylast/pylast";
    license = lib.licenses.asl20;
    maintainers = [ ];
  };
}

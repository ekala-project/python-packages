{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  psutil,
}:

buildPythonPackage rec {
  pname = "psutil-home-assistant";
  version = "0.0.1";
  format = "setuptools";

  src = fetchFromGitHub {
    owner = "home-assistant-libs";
    repo = "psutil-home-assistant";
    tag = version;
    hash = "sha256-6bj1aaa/JYZFVwUAJfxISRoldgTmumCG8WrlKhkb6kM=";
  };

  propagatedBuildInputs = [ psutil ];

  meta = {
    description = "Wrapper of psutil that removes reliance on globals";
    homepage = "https://github.com/home-assistant-libs/psutil-home-assistant";
    license = lib.licenses.asl20;
    teams = [ lib.teams.home-assistant ];
  };
}

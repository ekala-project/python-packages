{ lib
, beautifulsoup4
, buildPythonPackage
, fetchFromGitHub
, poetry-core
, rapidfuzz
, requests
,
}:

buildPythonPackage rec {
  pname = "syncedlyrics";
  version = "1.0.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "rtcq";
    repo = "syncedlyrics";
    tag = "v${version}";
    hash = "sha256-rKYze8Z7F6cEkpex6UCFUW9+mf2UWT+T86C5COhYQHY=";
  };

  build-system = [
    poetry-core
  ];

  pythonRelaxDeps = [ "rapidfuzz" ];

  dependencies = [
    requests
    rapidfuzz
    beautifulsoup4
  ];

  pythonImportsCheck = [ "syncedlyrics" ];

  meta = {
    description = "Module to get LRC format (synchronized) lyrics";
    homepage = "https://github.com/rtcq/syncedlyrics";
    license = lib.licenses.mit;
    maintainers = [ ];
    mainProgram = "syncedlyrics";
  };
}

{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  poetry-core,
  defusedxml,
  requests,
  httpretty,
}:

buildPythonPackage rec {
  pname = "youtube-transcript-api";
  version = "1.2.4";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "jdepoix";
    repo = "youtube-transcript-api";
    tag = "v${version}";
    hash = "sha256-FFLbDiZJR+xqaMMjcBQFYgrdJEofTiBdSNmmlMlrNfY=";
  };

  build-system = [ poetry-core ];

  pythonRelaxDeps = [
    "defusedxml"
  ];

  dependencies = [
    defusedxml
    requests
  ];
  pythonImportsCheck = [ "youtube_transcript_api" ];

  meta = {
    description = "Python API which allows you to get the transcripts/subtitles for a given YouTube video";
    mainProgram = "youtube_transcript_api";
    homepage = "https://github.com/jdepoix/youtube-transcript-api";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
}

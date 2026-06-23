{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  hatchling,
}:

buildPythonPackage rec {
  pname = "absl-py";
  version = "2.3.1";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "abseil";
    repo = "abseil-py";
    tag = "v${version}";
    hash = "sha256-U8doys7SoOhtUkF0dsCFKnM9ItOoi5a6cK6zGOe/U8s=";
  };

  build-system = [ hatchling ];

  pythonImportsCheck = [ "absl" ];

  meta = {
    description = "Abseil Python Common Libraries";
    homepage = "https://github.com/abseil/abseil-py";
    license = lib.licenses.asl20;
  };
}

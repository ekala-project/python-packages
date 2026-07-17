{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
}:

buildPythonPackage rec {
  pname = "pytube";
  version = "15.0.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "pytube";
    repo = "pytube";
    tag = "v${version}";
    hash = "sha256-Nvs/YlOjk/P5nd1kpUnCM2n6yiEaqZP830UQI0Ug1rk=";
  };

  build-system = [ setuptools ];

  # Most tests require network access
  doCheck = false;

  pythonImportsCheck = [ "pytube" ];

  meta = {
    description = "Python 3 library for downloading YouTube Videos";
    mainProgram = "pytube";
    homepage = "https://github.com/nficano/pytube";
    license = lib.licenses.mit;
  };
}

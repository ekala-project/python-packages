{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  requests,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "ytmusicapi";
  version = "1.12.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "sigma67";
    repo = "ytmusicapi";
    tag = version;
    hash = "sha256-kYx1pimYj+WBYgmxQUin/Af3d6o7HJzqy7DUkbDyKBI=";
  };

  build-system = [ setuptools-scm ];

  dependencies = [ requests ];

  pythonImportsCheck = [ "ytmusicapi" ];

  meta = {
    description = "Python API for YouTube Music";
    homepage = "https://github.com/sigma67/ytmusicapi";
    license = lib.licenses.mit;
    mainProgram = "ytmusicapi";
  };
}

{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  setuptools,
  setuptools-scm,
}:

buildPythonPackage rec {
  pname = "nest-asyncio";
  version = "1.6.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "erdewit";
    repo = "nest_asyncio";
    tag = "v${version}";
    hash = "sha256-5I5WItOl1QpyI4OXZgZf8GiQ7Jlo+SJbDicIbernaU4=";
  };

  build-system = [
    setuptools
    setuptools-scm
  ];

  pythonImportsCheck = [ "nest_asyncio" ];

  meta = {
    description = "Patch asyncio to allow nested event loops";
    homepage = "https://github.com/erdewit/nest_asyncio";
    license = lib.licenses.bsdOriginal;
  };
}
